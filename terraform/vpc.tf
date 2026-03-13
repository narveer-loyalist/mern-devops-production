resource "aws_vpc" "mern_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "mern-vpc"
  }
}