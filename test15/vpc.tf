resource "aws_vpc" "homelab" {
  cidr_block       = "10.255.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "homelab-vpc"
  }
}

resource "aws_default_route_table" "homelab" {
  default_route_table_id = aws_vpc.homelab.default_route_table_id

  tags = {
    Name = "main-rt"
  }
}

resource "aws_subnet" "public1" {
  vpc_id            = aws_vpc.homelab.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.255.0.0/24"

  tags = {
    Name = "public-subnet1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id            = aws_vpc.homelab.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.255.1.0/24"

  tags = {
    Name = "public-subnet2"
  }
}

resource "aws_subnet" "public3" {
  vpc_id            = aws_vpc.homelab.id
  availability_zone = "eu-west-1c"
  cidr_block        = "10.255.2.0/24"

  tags = {
    Name = "public-subnet3"
  }
}

resource "aws_subnet" "private1" {
  vpc_id            = aws_vpc.homelab.id
  availability_zone = "eu-west-1a"
  cidr_block        = "10.255.3.0/24"

  tags = {
    Name = "private-subnet1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id            = aws_vpc.homelab.id
  availability_zone = "eu-west-1b"
  cidr_block        = "10.255.4.0/24"

  tags = {
    Name = "private-subnet2"
  }
}

resource "aws_subnet" "private3" {
  vpc_id            = aws_vpc.homelab.id
  availability_zone = "eu-west-1c"
  cidr_block        = "10.255.5.0/24"

  tags = {
    Name = "private-subnet3"
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

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private.id
}
