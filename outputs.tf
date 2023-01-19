output "public_ip" {
  description = "Adresse IP publique"
  value       = module.ec2-ready.ec2_public_ip
}