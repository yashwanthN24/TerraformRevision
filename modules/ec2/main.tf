resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "main-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true 
  tags = { Name = "public-subnet" }
}

resource "aws_instance" "myserver" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id  # Key fix

  vpc_security_group_ids = [aws_security_group.sg.id]  # Use ID, create SG below

  tags = { Name = "myserver" }
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id

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
    Name = "myserver-sg"
  }
}

