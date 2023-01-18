# CREATION D'VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_zone
}

resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.my_ig.id
  }
}

resource "aws_route_table_association" "myrt_asso" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rt.id
}

# Configuration SSH
resource "aws_key_pair" "myssh_key" {
  key_name   = var.ssh_key_name
  public_key = file(var.public_ssh_key)
}

# Configuration SG
resource "aws_security_group" "my_sg" {
  name   = var.sg_name
  vpc_id = aws_vpc.my_vpc.id


  ingress = [{
    cidr_blocks      = var.sg_ingress_cidr_blocks
    description      = "Allow SSH"
    from_port        = var.sg_ingress_from_port
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = var.sg_ingress_protocol
    security_groups  = []
    self             = false
    to_port          = var.sg_ingress_to_port
  }]

  egress = [{
    description      = "Allow connection to any internet service"
    from_port        = var.sg_egress_from_port
    to_port          = var.sg_egress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_egress_cidr_blocks
    self             = false
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    security_groups  = []

  }]

}

# Configuration EC2
resource "aws_instance" "myec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type
  key_name                    = aws_key_pair.myssh_key.key_name
  vpc_security_group_ids      = [aws_security_group.my_sg.id]
  subnet_id                   = aws_subnet.my_subnet.id
  associate_public_ip_address = true

  depends_on = [var.bucket_depends_on]

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install epel -y
  sudo yum install epel-release s3fs-fuse awscli -y
  sudo mkdir /root/.aws
  sudo echo [default] > /root/.aws/credentials
  sudo echo aws_access_key_id = ${var.aws_access_key_id} >> /root/.aws/credentials
  sudo echo aws_secret_access_key = ${var.aws_secret_access_key} >> /root/.aws/credentials
  sudo mkdir /mnt/s3
  sudo chown ec2-user:ec2-user /mnt/s3
  sudo s3fs ${var.bucket_name} /mnt/s3 -o nonempty
  EOF

}