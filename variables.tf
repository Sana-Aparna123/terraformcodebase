variable "vpc_cidr_range" {
  description = "The CIDR range for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string

}

variable "igw_name" {
  description = "The name of the internet gateway"
  type        = string

}

variable "public_subnets_cidr_range" {
  description = "The CIDR range for the public subnets"
  type        = list(string)

}

variable "availability_zones" {
  description = "The availability zones for the public subnets"
  type        = list(string)

}

variable "private_subnets_cidr_range" {
  description = "The CIDR range for the private subnets"
  type        = list(string)

}


variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string

}

variable "region" {
  description = "The region in which to launch the EC2 instance"
  type        = string

}

variable "image_name" {
  description = "The name of the AMI to use for the EC2 instance"
  type        = map(string)
}

variable "key_name_instance" {
  description = "The name of the key pair to use for the EC2 instance"
  type        = string

}

variable "inbound_ports" {
  description = "The list of inbound ports to open on the security group"
  type        = list(number)
}

variable "outbound_ports" {
  description = "The list of outbound ports to open on the security group"
  type        = list(number)
}
variable "env" {
  description = "The environment in which the resources are being created"
  type        = string

}

variable "instance_object" {

}