vpc_cidr_range             = "10.0.0.0/16"
vpc_name                   = "MyVPC"
igw_name                   = "MyInternetGateway"
public_subnets_cidr_range  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.1.0/24"]
availability_zones         = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
private_subnets_cidr_range = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24", "10.0.40.0/24", "10.0.10.0/24"]
instance_type              = "t2.micro"
image_name = {
  "us-east-1" = "ami-005fc0f236362e99f",
  "us-east-2" = "ami-00eb69d236edcfaf8"
}
region            = "us-east-1"
key_name_instance = "devops-key"
inbound_ports     = [22, 80, 443, 3306, 1433, 3389, 22, 80, 443]
outbound_ports    = [22, 80, 443, 22, 80, 443]
env               = "Dev"

instance_object = [
  {
    name          = "Instance A"
    enabled       = true
    instance_type = "t2.micro"
    env           = "dev"
    key_name      = "devops-key"
  },
  {
    name          = "Instance B"
    enabled       = false
    instance_type = "t2.micro"
    env           = "prod"
    key_name      = "devops-key-2"
  }
]




