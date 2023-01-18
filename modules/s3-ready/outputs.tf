output "logging" {
  value = {}
  depends_on = [aws_s3_bucket.my_bucket]
}