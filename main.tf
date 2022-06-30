# the service and location
provider "aws" {
        region = "eu-west-1"
}

# create a VPC
resource "aws_vpc" "eng114_syed_terraform_vpc" {
  cidr_block = "10.50.0.0/16"
  instance_tenancy = "default"

  tags = {
      Name = "eng114_syed_terraform_vpc"
  }
}

# create a internet gateway

resource "aws_internet_gateway" "eng114_syed__terraform_ig" {
  vpc_id = aws_vpc.eng114_syed_terraform_vpc.id

  tags = {
    Name = "eng114_syed_terraform_ig"
  }
}

# create a public and a private subnets

resource "aws_subnet" "eng114_syed_terraform_public_subnet" {
  vpc_id     = aws_vpc.eng114_syed_terraform_vpc.id
  cidr_block = "10.50.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng114_syed_terraform_public_subnet"
  }
}

resource "aws_subnet" "eng114_syed_terraform_private_subnet" {
  vpc_id     = aws_vpc.eng114_syed_terraform_vpc.id
  cidr_block = "10.50.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng114_syed_terraform_private_subnet"
  }
}

#
