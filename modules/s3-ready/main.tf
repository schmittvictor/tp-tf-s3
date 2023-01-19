# Configuration Bucket S3
resource "aws_s3_bucket" "my_bucket" {
  bucket        = var.bucket_name
  force_destroy = true
}

# Configuration Bucket S3 Policy
resource "aws_s3_bucket_policy" "my_bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "DenyAllButEC2AndESGI",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::${var.bucket_name}/*"
        ],
        "Condition" : {
          "NotIpAddress" : {
            "aws:SourceIp" : "${var.ec2_public_ip}"
          }
        }
      }
    ]
  })
}

