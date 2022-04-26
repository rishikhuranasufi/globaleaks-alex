resource "aws_vpc" "main-vpc" {
  cidr_block = var.subnet-3_cidr_block
  enable_dns_hostnames = "true"
     tags = {
             Name = "globaleaks-vpc"
             }
}
resource "aws_subnet" "subnet-1" {
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = var.subnet-1_cidr_block
  map_public_ip_on_launch = "true"
  tags = {
    Name = "globaleaks-subnet-1"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
     Name = "globaleaks-igw"
  }
}
resource "aws_route_table" "my-route-table" {
  vpc_id = aws_vpc.main-vpc.id

  route {
	cidr_block = var.subnet-2_cidr_block
	gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
	Name = "globaleaks-route-table"
  }
}
resource "aws_route_table_association" "my-route-association" {
  subnet_id = aws_subnet.subnet-1.id
  route_table_id = aws_route_table.my-route-table.id
}
