resource "aws_instance" "my-instance" {
  key_name        = aws_key_pair.terraform-key.key_name
  ami             = var.ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.my-sg.name]
  iam_instance_profile = aws_iam_instance_profile.role-profile.name



  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

 provisioner "file" {
    source      = "userdata.sh"
    destination = "/tmp/userdata.sh"
  }

  
  
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/userdata.sh",
      "sudo /tmp/userdata.sh",
      "sudo echo 'big-bruh' | sudo tee /etc/hostname",
    ]
  }

  provisioner "local-exec" {
    command = "ssh ec2-user@${aws_instance.my-instance.public_ip} 'kubectl get nodes '"
  }

}

output "k8-public-IP" {
  value = aws_instance.my-instance.public_ip
}
