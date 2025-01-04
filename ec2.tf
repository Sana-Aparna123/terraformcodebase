resource "aws_instance" "public_servers" {
  count             = var.env == "Dev" || var.env == "DEV" ? 3 : 1
  ami               = lookup(var.image_name, var.region)
  instance_type     = var.instance_type
  availability_zone = element(var.availability_zones, count.index)
  subnet_id         = element(aws_subnet.public_subnets[*].id, count.index)
  vpc_security_group_ids = [
    aws_security_group.allow_all_sg_dynamic.id,
    aws_security_group.allow_all_sg.id
  ]
  associate_public_ip_address = true
  key_name                    = var.key_name_instance

  tags = {
    Name = "${var.vpc_name}-Nginx-Server-${count.index + 1}"
    Env  = var.env
  }

  # User data script to deploy Nginx
  user_data = <<-EOF
   #!/bin/bash
   yum update -y
   yum install telnet -y
   yum install -y tmux
   amazon-linux-extras install nginx1.12 -y
   service nginx start
   systemctl enable nginx
   echo "<div><h1>$(cat /etc/hostname)</h1></div>" >> /usr/share/nginx/html/index.html
  EOF

  # lifecycle {
  #   ignore_changes = [
  #     user_data,
  #     tags
  #   ]
  #   #revent_destroy = true  # Prevents the instance from being destroyed by terraform
  #   prevent_destroy = false
  # }
}