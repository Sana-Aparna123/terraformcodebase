resource "null_resource" "cluster" {
  count = var.env == "Dev" || var.env == "DEV" ? 3 : 1
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/bootlabsuser/Downloads/devops-key.pem")
      host        = element(aws_instance.public_servers.*.public_ip, count.index)
    }
  }
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/script.sh",
      "sudo apt update",
      "sudo apt install -y tree",
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("/home/bootlabsuser/Downloads/devops-key.pem")
      host        = element(aws_instance.public_servers.*.public_ip, count.index)
    }
  }
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.public_servers.*.public_ip, count.index)} >> public_ips_server.txt"
    }
  provisioner "local-exec" {
    command = "echo ${element(aws_instance.public_servers.*.private_ip, count.index)} >> private_ips_server.txt"
    }

#   This resource will be recreated if there is a change in the tag version.
    triggers = {
      public-servers-tags = element(aws_instance.public_servers.*.tags.version, count.index)
    }
}