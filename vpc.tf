resource "aws_vpc" "vpc1" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "vpc1"
  }

}

#Attach the internet gateway to the VPC
resource "aws_internet_gateway" "vpc1-igw" {
  vpc_id = aws_vpc.vpc1.id #implicit dependency on the VPC resource

  tags = {
    Name = "vpc1-igw"
  }
}

