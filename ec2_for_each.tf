#https://spacelift.io/blog/terraform-for-each
resource "aws_instance" "by_object" {
  for_each      = { for inst in var.instance_object : inst.name => inst }
  ami           = "ami-0ca9fb66e076a6e32"
  instance_type = each.value.instance_type
  key_name      = each.value.key_name

  tags = {
    Name = each.key
    Env  = each.value.env
  }
}