# Configuration VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
}

# Configuration subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.subnet_zone

  depends_on = [
    aws_vpc.my_vpc
  ]

}

# Configuration Internet Gateway
resource "aws_internet_gateway" "my_ig" {
  vpc_id = aws_vpc.my_vpc.id

  depends_on = [
    aws_vpc.my_vpc
  ]
}

# Configuration route table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.my_ig.id
  }

  depends_on = [
    aws_vpc.my_vpc, 
    aws_internet_gateway.my_ig
  ]
}

# Configuration association subnet et route table
resource "aws_route_table_association" "myrt_asso" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_rt.id

  depends_on = [
    aws_subnet.my_subnet, 
    aws_route_table.my_rt
  ]
}
