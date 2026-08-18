resource "aws_vpc" "My-VPC-04-11" {
  cidr_block = var.My-VPC-04-11-cidr
  tags = {
    Name = var.My-VPC-04-11
  }
}

resource "aws_subnet" "My-VPC-04-11-subnet" {
  vpc_id                  = aws_vpc.My-VPC-04-11.id
  cidr_block              = var.My-vpc-subnet-cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.My-VPC-04-11}-subnet"
  }
}

resource "aws_internet_gateway" "My-IGW-04-11" {
  vpc_id = aws_vpc.My-VPC-04-11.id
  tags = {
    Name = "${var.My-VPC-04-11}-igw"
  }
}

resource "aws_route_table" "My-RT-04-11-public" {
  vpc_id = aws_vpc.My-VPC-04-11.id
  tags = {
    Name = "${var.My-VPC-04-11}-rt"
  }
}

resource "aws_route" "My-Route-04-11-public" {
  route_table_id         = aws_route_table.My-RT-04-11-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.My-IGW-04-11.id
}

resource "aws_route_table_association" "My-rt-association-04-11-public" {
  subnet_id      = aws_subnet.My-VPC-04-11-subnet.id
  route_table_id = aws_route_table.My-RT-04-11-public.id
}

