resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc1.id
  # route = {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = aws_internet_gateway.vpc1-igw.id
  # }
  tags = {
    Name = "${var.vpc_name}-public-route-table"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc1.id
  tags = {
    Name = "${var.vpc_name}-private-route-table"
  }
}

#Add a route of igw to the route table
resource "aws_route" "route_to_igw" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1-igw.id
}


#Route table association
resource "aws_route_table_association" "public_subnets_association" {
  # count = 3
  count = length(local.public_subnets_cidr_range)
  # subnet_id      = aws_subnet.public_subnets[count.index].id
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnets_association" {
  # count = 3
  count = length(local.private_subnets_cidr_range)
  # subnet_id      = aws_subnet.private_subnets[count.index].id
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}



