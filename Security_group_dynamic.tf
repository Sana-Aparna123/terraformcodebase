#for_each wont work with list to remove duplicates do we can't use distinct.we can use set.
#    locals {
#     inbound_ports  = toset(var.inbound_ports)
#     outbound_ports = toset(var.outbound_ports)
#    }

locals {
  #create a list of unique inbound ports with order preserved
  inbound_ports = distinct(var.inbound_ports)
  #create a set of unique outbound ports with no order.
  outbound_ports = toset(var.outbound_ports)
}


resource "aws_security_group" "allow_all_sg_dynamic" {
  name        = "allow_all_sg_dynamic"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc1.id

  tags = {
    Name = "allow_all_sg_dynamic"
  }

  #Since inbound_ports is a list, we can use value to access the elements.
  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  #Since outbound_ports is a set, we can use either key or value to access the elements.
  dynamic "egress" {
    for_each = local.outbound_ports
    content {
      # from_port   = egress.value
      # to_port     = egress.value
      from_port   = egress.key
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }


  #   ingress {
  #     description = "Allow_tcp22_traffic"
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #   }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
}

