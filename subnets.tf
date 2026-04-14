#creation of public subnet
resource "aws_subnet" "public-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/22"

  tags = {
    Name = "public-subnet"
  }
}

#creation of private subnet
resource "aws_subnet" "private-sub" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/22"

  tags = {
    Name = "private-subnet"
  }
}