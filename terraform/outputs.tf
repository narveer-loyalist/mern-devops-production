output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.mern_instance.public_ip
}

output "ec2_public_dns" {
  description = "Public DNS of EC2 instance"
  value       = aws_instance.mern_instance.public_dns
}

output "vpc_id" {
  value = aws_vpc.mern_vpc.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}