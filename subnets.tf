resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "vpc1-subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "vpc1-subnet2"
  }
}

resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "vpc1-subnet3"
  }
}