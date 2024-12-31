resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpc_cidr_range
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }

}

#Attach the internet gateway to the VPC
resource "aws_internet_gateway" "vpc1-igw" {
  vpc_id = aws_vpc.vpc1.id #implicit dependency on the VPC resource

  tags = {
    Name = var.igw_name
  }
}

