# Variables AWS
aws_region            = "us-east-1"
aws_access_key_id     = "ASIASUFI63LK6C34KGUA"
aws_secret_access_key = "jLyQSMmRTGMmGx3rb51ECogLaSShhtjxP3lIJOYS"
aws_session_token     = "FwoGZXIvYXdzEAgaDCBgWLH71TcoSM3xDSK/AUVLuaZyyomANUOovTe0YngRt1xKm8QOtxBf9mBz6UI44fjIxZ2CTvWUOZHE8xqBgvgQrkTNgMj5Oc8QBqC7cN3l/h0lzIeZqtBh/Rh99ghFRMXRotVSGXZA76g7wH4gsoSI4aeI8iQdtVootG2avgeVQb23smoV4tgIXnsLaYv+P27lg0s+5GpNhsMu5E5/rfks1kl3HUTycASbLjAMRI7zjCXx3E7q6NtVockzV/GHxBzbhYc+WnzNJaIBy2ZsKJeMoJ4GMi21+FT6mzGYZ/gkOg6YrOrRPTEnTPhianLCK+b+abqmMEiwbJdswaUKPe5/Q00="

# IP ESGI
esgi_ip = "94.228.190.38"

# Variables SSH
# Nom de la paire de clés SSH
ssh_key_name = "ssh_key"

# Clé publique de la paire de clés SSH
public_ssh_key = "ssh_keys/ssh_key.pub"

# VPC
vpc_cidr_block = "10.0.0.0/16"

# Subnet CIDR block
subnet_cidr_block = "10.0.1.0/24"

# Subnet zone
subnet_zone = "us-east-1a"

# Variables SG
# Nom du groupe de sécurité
sg_name = "my_sg"

# Protocole pour la règle d'entrée du groupe de sécurité
sg_ingress_protocol = "tcp"

# Port de début pour la règle d'entrée du groupe de sécurité
sg_ingress_from_port = 22

# Port de fin pour la règle d'entrée du groupe de sécurité
sg_ingress_to_port = 22

# Liste des blocs CIDR autorisés à accéder au groupe de sécurité
sg_ingress_cidr_blocks = ["0.0.0.0/0"]

# Port de début pour la règle d'entrée du groupe de sécurité
sg_egress_from_port = 0

# Port de fin pour la règle d'entrée du groupe de sécurité
sg_egress_to_port = 0

# Liste des blocs CIDR autorisés à accéder au groupe de sécurité
sg_egress_cidr_blocks = ["0.0.0.0/0"]

# Variables EC2
# ID de l'AMI pour l'instance EC2
ec2_ami = "ami-0b5eea76982371e91"

# Type d'instance
ec2_instance_type = "t2.medium"

# Nom de l'instance EC2
ec2_name = "myvm"

# Nom du bucket S3
bucket_name = "bucketlamsch"

# Route table CIDR block
route_table_cidr_block = "0.0.0.0/0"