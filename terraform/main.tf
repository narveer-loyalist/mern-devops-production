resource "aws_security_group" "mern_sg" {
  name        = "mern-devops-sg"
  description = "Allow SSH and App ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mern_instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.mern_sg.id]

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
