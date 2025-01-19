resource "aws_vpc" "homelab" {
  cidr_block       = "10.255.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "homelab-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.homelab.id
  cidr_block = "10.255.0.0/24"

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.homelab.id
  cidr_block = "10.255.1.0/24"

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.homelab.id

  tags = {
    Name = "main-ig"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.homelab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.homelab.id

  tags = {
    Name = "private-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
