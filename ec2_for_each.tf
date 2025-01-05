#https://spacelift.io/blog/terraform-for-each
resource "aws_instance" "by_object" {
  for_each      = { for inst in var.instance_object : inst.name => inst }
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  tags = {
    Name = each.key
    Env  = each.value.env
  }
}