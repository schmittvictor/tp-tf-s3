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

    depends_on = [
      aws_vpc.my_vpc
    ]
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

  depends_on = [
    aws_key_pair.myssh_key, 
    aws_security_group.my_sg, 
    aws_subnet.my_subnet, 
    var.bucket_depends_on
  ]

  user_data = <<-EOF
  #!/bin/bash
  sudo apt-get update -y && sudo apt-get install s3fs awscli -y
  aws configure set aws_access_key_id ${var.aws_access_key_id} 
  aws configure set aws_secret_access_key ${var.aws_secret_access_key}
  aws configure set aws_session_token ${var.aws_session_token}
  mkdir /mnt/s3
  s3fs ${var.bucket_name} /mnt/s3 -o profile=default -o nonempty,rw,allow_other,mp_umask=002,uid=1000,gid=1000 -o url=http://s3.${var.aws_region}.amazonaws.com/
  echo ${var.bucket_name} /mnt/s3 fuse.s3fs _netdev,allow_other 0 0 | sudo tee -a /etc/fstab
  EOF

}