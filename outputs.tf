# Récupération de l'adresse IP publique de l'instance EC2
output "ec2_public_ip" {
  value = aws_instance.myec2.public_ip
}