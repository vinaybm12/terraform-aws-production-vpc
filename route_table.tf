#public RT
resource "aws_route_table" "pub-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    name = "public-RT"
  }
}

#private RT
resource "aws_route_table" "pri-rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    name = "public-RT"
  }
}

#attaching public RT to public subnet
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-sub.id
  route_table_id = aws_route_table.pub-rt.id
}

#attaching private RT to private subnet
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.private-sub.id
  route_table_id = aws_route_table.pri-rt.id
}