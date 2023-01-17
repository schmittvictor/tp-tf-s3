output "public-ip" {
  description = "Adresse IP publique"
  value       = module.ec2-s3-ready.ec2_public_ip
}