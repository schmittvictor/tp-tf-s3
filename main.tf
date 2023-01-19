module "s3-ready" {
  source = "./modules/s3-ready"
  
  # Nom du bucket S3
  bucket_name = var.bucket_name

  ec2_public_ip = module.ec2-ready.ec2_public_ip

}

module "ec2-ready" {
  source = "./modules/ec2-ready"

  aws_region            = var.aws_region
  aws_access_key_id     = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  aws_session_token     = var.aws_session_token

  # Variables SSH
  # Nom de la paire de clés SSH
  ssh_key_name = var.ssh_key_name

  # Clé publique de la paire de clés SSH
  public_ssh_key = var.public_ssh_key

  # Nom du bucket S3
  bucket_name = var.bucket_name

  # VPC
  vpc_cidr_block = var.vpc_cidr_block

  # Subnet CIDR block
  subnet_cidr_block = var.subnet_cidr_block

  # Subnet zone
  subnet_zone = var.subnet_zone

  # Variables SG
  # Nom du groupe de sécurité
  sg_name = var.sg_name

  # Protocole pour la règle d'entrée du groupe de sécurité
  sg_ingress_protocol = var.sg_ingress_protocol

  # Port de début pour la règle d'entrée du groupe de sécurité
  sg_ingress_from_port = var.sg_ingress_from_port

  # Port de fin pour la règle d'entrée du groupe de sécurité
  sg_ingress_to_port = var.sg_ingress_to_port

  # Liste des blocs CIDR autorisés à accéder au groupe de sécurité
  sg_ingress_cidr_blocks = var.sg_ingress_cidr_blocks

  # Port de début pour la règle d'entrée du groupe de sécurité
  sg_egress_from_port = var.sg_egress_from_port

  # Port de fin pour la règle d'entrée du groupe de sécurité
  sg_egress_to_port = var.sg_egress_to_port

  # Liste des blocs CIDR autorisés à accéder au groupe de sécurité
  sg_egress_cidr_blocks = var.sg_egress_cidr_blocks

  # Variables EC2
  # ID de l'AMI pour l'instance EC2
  ec2_ami = var.ec2_ami

  # Type d'instance
  ec2_instance_type = var.ec2_instance_type

  # Nom de l'instance EC2
  ec2_name = var.ec2_name

  # Route table CIDR block
  route_table_cidr_block = var.route_table_cidr_block

  bucket_depends_on = [module.s3-ready.logging]
}