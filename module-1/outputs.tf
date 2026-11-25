output "public_ip" {
  description = "public ip of web server ec2"
  value = aws_instance.web_server.public_ip
}