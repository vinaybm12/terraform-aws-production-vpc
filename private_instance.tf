resource "aws_instance" "pri-ins" {
  ami           = "ami-05d2d839d4f73aafb"
  instance_type = "t3.micro"
  #associate_public_ip_address = true
  subnet_id = aws_subnet.private-sub.id
  key_name = "public-key"
  vpc_security_group_ids = [ aws_security_group.allow_ssh_http.id ]


  tags = {
    Name = "private-instance"
  }
}