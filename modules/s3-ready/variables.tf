# Variables S3
variable "bucket_name" {
  type = string
}

# EC2 IP from module ec2-ready
variable "ec2_public_ip" {
  type = string
}