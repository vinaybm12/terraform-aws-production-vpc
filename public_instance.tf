#ec2 instance in public subnet
resource "aws_instance" "pub-ins" {
  ami           = var.instance_id
  instance_type = "t3.micro"
  associate_public_ip_address = true
  subnet_id = aws_subnet.public-sub.id
  key_name = "public-key"
  vpc_security_group_ids = [ aws_security_group.allow_ssh_http.id ]
  count = 2


  tags = {
    Name = "public-instance"
  }
}

#create key pair
resource "aws_key_pair" "deployer" {
  key_name   = "public-key"
  public_key = file("vpc-key.pub")
}