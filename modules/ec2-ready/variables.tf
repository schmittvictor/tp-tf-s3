# Variables AWS
variable "aws_access_key_id" {
  description = "AWS Access key for account"
  type        = string
}

variable "aws_secret_access_key" {
  description = "AWS Secret key for account"
  type        = string
}

variable "aws_session_token" {
  description = "AWS Session token for account"
  type        = string
}

# Variables SSH
# Nom de la paire de clés SSH
variable "ssh_key_name" {
  type = string
}

# Clé publique de la paire de clés SSH
variable "public_ssh_key" {
  type = string
}

# VPC
variable "vpc_cidr_block" {
  type = string
}

# Variables S3
variable "bucket_name" {
  type = string
}

# Subnet CIDR block
variable "subnet_cidr_block" {
  type = string
}

# Subnet zone
variable "subnet_zone" {
  type = string
}

# Variables SG
# Nom du groupe de sécurité
variable "sg_name" {
  type = string
}

# Protocole pour la règle d'entrée du groupe de sécurité
variable "sg_ingress_protocol" {
  type = string
}

# Port de début pour la règle d'entrée du groupe de sécurité
variable "sg_ingress_from_port" {
  type = number
}

# Port de fin pour la règle d'entrée du groupe de sécurité
variable "sg_ingress_to_port" {
  type = number
}

# Liste des blocs CIDR autorisés à accéder au groupe de sécurité
variable "sg_ingress_cidr_blocks" {
  type = list(string)
}

# Port de début pour la règle d'entrée du groupe de sécurité
variable "sg_egress_from_port" {
  type = number
}

# Port de fin pour la règle d'entrée du groupe de sécurité
variable "sg_egress_to_port" {
  type = number
}

# Liste des blocs CIDR autorisés à accéder au groupe de sécurité
variable "sg_egress_cidr_blocks" {
  type = list(string)
}

# Variables EC2
# ID de l'AMI pour l'instance EC2
variable "ec2_ami" {
  type = string
}

# Type d'instance pour l'instance EC2
variable "ec2_instance_type" {
  type = string
}

# Nom de l'instance EC2
variable "ec2_name" {
  type = string
}

# Route table CIDR block
variable "route_table_cidr_block" {
  type = string
}

variable "bucket_depends_on" {
  type    = any
  default = []
}
