locals {
  public_subnets_cidr_range  = distinct(var.public_subnets_cidr_range)
  private_subnets_cidr_range = distinct(var.private_subnets_cidr_range)
}

resource "aws_subnet" "public_subnets" {
  # count             = 3 #0 1 2 
  count             = length(local.public_subnets_cidr_range)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(local.public_subnets_cidr_range, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.vpc_name}-public-subnet${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  # count             = 3
  count             = length(local.private_subnets_cidr_range)
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = element(local.private_subnets_cidr_range, count.index)
  availability_zone = element(var.availability_zones, count.index)
  tags = {
    Name = "${var.vpc_name}-private-subnet${count.index + 1}"
  }
}














