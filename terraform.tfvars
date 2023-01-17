# Variables AWS
aws_region            = "us-east-1"
aws_access_key_id     = "ASIASUFI63LKRGVIY2PA"
aws_secret_access_key = "3X4iEO4OOeHK2rn2l9vX2jZZlCFzwpsmb4vdIXn0"
aws_session_token     = "FwoGZXIvYXdzEPD//////////wEaDKpT1zKU752H/DUu0iK/AQEZR0bqzApgLxsXIrtK0mBrLf3//+DxqsWLbibkW+IBBsf/1fgMW8W5FkftLfrV/yh95THRn1zYV+i3PLl45/jFnRvHXUUP1y+oB2T/SYyma5u/G/Zxe9oNRFsaVAxi9xDAjdg/CRczcsEsar0LmXDpNxt+5AOVZIZ89WtZ2UQgdFopDeCqTwSqiwXiiUzRU5FwTLAKM+2xVVEOUsDrbUPy61FuuYNrCEWYbfIl2WARREp8HbImI5yVjGCYDYszKO7emp4GMi1Mhd1LQn4vKsmO2lU2tVjjQrpSglve8fLKnf9Nj29cVD077v74WUmK6/anU4w="

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
ec2_ami = "ami-06878d265978313ca"

# Type d'instance
ec2_instance_type = "t2.medium"

# Nom de l'instance EC2
ec2_name = "myvm"

# Nom du bucket S3
bucket_name = "bucket-lam-sch-2"

# Route table CIDR block
route_table_cidr_block = "0.0.0.0/0"