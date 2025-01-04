output "inbound_ports" {
  value = local.inbound_ports

}

output "outbound_ports" {
  value = local.outbound_ports
}

output "public_subnets" {
  value = local.public_subnets_cidr_range
}

output "private_subnets" {
  value = local.private_subnets_cidr_range
}

output "public_servers" {
  value = aws_instance.public_servers[*].public_ip
}

