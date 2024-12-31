resource "aws_instance" "Nginx-Server-01" {
  ami                        = var.image_name
  instance_type               = var.instance_type
  availability_zone           = "us-east-1a"
  subnet_id                   = aws_subnet.subnet1.id
  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  key_name                    = var.key_name_instance

  tags = {
    Name       = "${var.vpc_name}-Nginx-Server"
    Env        = "Prod"
    Owner      = "Aparna"
    CostCenter = "ABCD"
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

  lifecycle {
    ignore_changes = [
      user_data,
      tags
    ]
    #revent_destroy = true  # Prevents the instance from being destroyed by terraform
    prevent_destroy = false
  }
}