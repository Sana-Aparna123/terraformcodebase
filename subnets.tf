resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.subnet1_cidr_range

  tags = {
    Name = "${var.vpc_name}-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.subnet2_cidr_range

  tags = {
    Name = "${var.vpc_name}-subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.subnet3_cidr_range

  tags = {
    Name = "${var.vpc_name}-subnet3"
  }
}