resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.10.0/24"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.10.0/24"
}

# Configuration SSH
resource "aws_key_pair" "myssh-key" {
  key_name   = var.ssh_key_name
  public_key = file(var.public_ssh_key)
}

# Configuration SG
resource "aws_security_group" "my-sg" {
  name   = var.sg_name
  vpc_id = aws_vpc.my_vpc.id

  ingress = [{
    cidr_blocks      = var.sg_ingress_cidr_blocks
    description      = "Autoriser SSH"
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
    from_port        = 0
    to_port          = 0
    protocol         = var.sg_egress_protocol
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
  key_name                    = aws_key_pair.myssh-key.key_name
  security_groups             = [aws_security_group.my-sg.id]
  subnet_id                   = aws_subnet.my_subnet.id
  associate_public_ip_address = true
  tags = {
    "Name" = var.ec2_name
  }
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
