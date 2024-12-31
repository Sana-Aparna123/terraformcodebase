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

variable "subnet1_cidr_range" {
  description = "The CIDR range for subnet1"
  type        = string
}

variable "subnet2_cidr_range" {
  description = "The CIDR range for subnet2"
  type        = string
}

variable "subnet3_cidr_range" {
  description = "The CIDR range for subnet3"
  type        = string

}

