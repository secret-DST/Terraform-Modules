terraform {
  required_version = "~> 1.15.0"
}

resource "aws_instance" "web_server" {
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = "eu-keys"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web_server_1.id]
  tags = {
    "Name" = "Demo EC2 1"
  }
  user_data = <<-EOF
    #!/bin/bash

    set -e

    # Update packages and install Apache
    apt-get update -y
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2

    # Retrieve EC2 hostname
    HOSTNAME=$(hostname)

    # Create website
    cat > /var/www/html/index.html <<HTML
    <!DOCTYPE html>
    <html>
    <head>
        <title>EC2 Apache Server</title>
    </head>
    <body>
        <h1>Web Server from AWS EC2 1!</h1>
        <h2>Hostname: $HOSTNAME</h2>
        <p>Apache2 is running successfully.</p>
    </body>
    </html>
    HTML

    # Enable and start Apache
    sudo systemctl enable apache2
    sudo systemctl start apache2
 EOF
}

resource "aws_security_group" "web_server_1" {
  name = "web-server-sg"
  description = "allows http and ssh"

  ingress {
    from_port = 22
    protocol =  "TCP"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0" ]

  }

  ingress {
    from_port = 80
    protocol =  "TCP"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0" ]

  }

  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks =  ["0.0.0.0/0"]

  }
}