resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc1.id

  #   route {
  #     # cidr_block = "10.0.1.0/24"
  #     gateway_id = aws_internet_gateway.vpc1-igw.id
  #   }


  #   route {
  #     cidr_block = "10.0.2.0/24"
  #     gateway_id = aws_internet_gateway.vpc1-igw.id
  #   }


  #   route {
  #     cidr_block = "10.0.3.0/24"
  #     gateway_id = aws_internet_gateway.vpc1-igw.id
  #   }

  #   route {
  #     ipv6_cidr_block        = "::/0"
  #     egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  #   }

  tags = {
    Name = "vpc1-public-route-table"
  }
}
#Add a route of igw to the route table
resource "aws_route" "route_to_igw" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc1-igw.id
}


#Route table association
resource "aws_route_table_association" "subnet1_association" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "subnet2_association" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}


resource "aws_route_table_association" "subnet3_association" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.public_route_table.id
}
