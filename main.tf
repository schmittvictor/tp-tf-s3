#CREATION D'VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}

resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
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
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow SSH"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "TCP"
    security_groups  = []
    self             = false
    to_port          = 22
  }]

  egress = [{
    description      = "Allow connection to any internet service"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
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
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowIPAddress",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ],
        "Condition" : {
          "IpAddress" : {
            "aws:SourceIp" : "${aws_instance.myec2.public_ip}"
          }
        }
      }
    ]
  })
}

