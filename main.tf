module "ec2_instance" {
    source = "./modules/ec2"
    ami = "ami-0ad737a8b58b3fb92"
}

# using existing modules 