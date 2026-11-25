output "public_ip" {
  description = "public ip of ec2 instance"
  value = aws_instance.database_server.public_ip
}