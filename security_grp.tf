#create security group for 22 and 80
resource "aws_security_group" "allow_ssh_http" {
  name        = "allow_ssh_http"
  #description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "sg-01"
  }
}

#adding inbound port 22
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

#allow inbound http port 80
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

#add outbound rule
resource "aws_vpc_security_group_egress_rule" "outbound" {
  security_group_id = aws_security_group.allow_ssh_http.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}