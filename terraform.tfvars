# Variables AWS
aws_region        = "us-east-1"
aws_access_key    = "ASIASUFI63LK2WTWOVOO"
aws_secret_key    = "0C3wWLOjvGVwAS/LNPoDQk3PAzmUCmPOqlIs42io"
aws_token_session = "FwoGZXIvYXdzEOz//////////wEaDLVGsu0C0jmobHVxhiK/AT3ijBHtr9/9y8rwbJCze/+gChPohr3NJHW7NlaBCj32wxAh5slmVwq8pmgIt0DFeWWNXDLtgFYB4QOb5iMBQ0RmLFVilUsx18fEzRXx77FZrVjlVJTZeZ9nJ6HXWG79l1QVV4Ewl14Zjp1TA+Vq9Vgh8SDV6vnxjCiJlm3RKEzetH2bsNjG019c8KpHFx7XsypyvNS+dIydgjcgIkHSxt4W5hCrm671I7OBXZmvsMjA/rZtdU0KZ0vHWRr7ZYKCKM3mmZ4GMi1pDUikkTqerbfoZB1MvdFTcbOLtbXNG543KTy446MKni9HzM1Ghv7leKmMXw0="

# Variables SSH
# Nom de la paire de clés SSH
ssh_key_name = "ssh_key"

# Clé publique de la paire de clés SSH
public_ssh_key = "ssh_key/ssh_key.pub"

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
ec2_ami = "ami-0c94855ba95c71c99"

# Type d'instance
ec2_instance_type = "t2.micro"

# Nom de l'instance EC2
ec2_name = "myvm"

bucket_name = "bucket-lam-sch-2"