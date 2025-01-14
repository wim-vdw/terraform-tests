resource "aws_vpc" "homelab1" {
  cidr_block       = "10.255.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "homelab1-vpc"
  }
}

resource "aws_vpc" "homelab2" {
  cidr_block       = "10.254.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "homelab2-vpc"
  }
}
