# provider.tf
provider "aws" {
  region = var.region
}
# main.tf
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Define user data to install and start Nginx web server
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install nginx1.12 -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  # Security group to allow HTTP and SSH access
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "web_sg" {
  name        = var.security_group_name
  description = var.security_group_description

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}
