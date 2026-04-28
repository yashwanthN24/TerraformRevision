variable "instance_type" {
  description = "Instance type of ec2 instance"
  default = "t3.micro"
}

variable "ami" {
  description = "OS type of the machine"
}

# For variables not with default values we can pass values via terraform.tfvars file
# which terraform looks at by default 

