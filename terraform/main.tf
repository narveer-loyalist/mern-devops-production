resource "aws_instance" "mern_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = "mern-devops-instance"
  }
}

resource "local_file" "ansible_inventory" {
  content  = <<EOF
    [web]
    ${aws_instance.mern_instance.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${var.ssh_key_path}
    EOF
  filename = "${path.module}/../ansible/inventory.ini"
}
