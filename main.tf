module "ec2-s3-ready" {
  source = "./modules/ec2-s3-ready"

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
  ec2_ami = "ami-0c94855ba95c71c99"

  # Type d'instance
  ec2_instance_type = "t2.micro"

  # Nom de l'instance EC2
  ec2_name = "myvm"

  # Nom du bucket S3
  bucket_name = "bucket-lam-sch-2"

  # Route table CIDR block
  route_table_cidr_block = "0.0.0.0/0"
}