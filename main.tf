provider "aws" {
  region = var.region
}

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "custom-vpc"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.subnet_1_cidr
  availability_zone = var.availability_zone_1
  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = var.subnet_2_cidr
  availability_zone = var.availability_zone_2
  tags = {
    Name = "subnet-2"
  }
}

# ... rest of the resources remain the same, just update instance_type and ami_id

resource "aws_instance" "web1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_1.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "WebServer1"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Web Server 1" > /var/www/html/index.html
              EOF
}

resource "aws_instance" "web2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnet_2.id
  security_groups = [aws_security_group.web_sg.name]

  tags = {
    Name = "WebServer2"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "Web Server 2" > /var/www/html/index.html
              EOF
}
