output "public_ip"{
    description ="public_ip of a instances"
    value = aws_instance.pub-ins[*].public_ip
}