resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.mern_vpc.id
}