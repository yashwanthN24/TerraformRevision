resource "aws_instance" "myserver" {
    instance_type = var.instance_type
    ami = var.ami
}

