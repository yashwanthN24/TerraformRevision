terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}

provider "aws" {
 region = "ap-south-1"
}

# import {
#    id = "i-0aa1ca77fc26045ca" 
#    to = aws_instance.main1
#}

resource "aws_instance" "main1" {
  ami                                  = "ami-0e12ffc2dd465f6e4"
  associate_public_ip_address          = true
  availability_zone                    = "ap-south-1b"
  disable_api_stop                     = false
  disable_api_termination              = false
  ebs_optimized                        = true
  force_destroy                        = false
  get_password_data                    = false
  hibernation                          = false
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t3.micro"
  ipv6_address_count                   = 0
  key_name                             = "ci_pipeline_nodejs"
  monitoring                           = false
  placement_partition_number           = 0
  private_ip                           = "172.30.1.171"
  region                               = "ap-south-1"
  secondary_private_ips                = []
  security_groups                      = []
  source_dest_check                    = true
  subnet_id                            = "subnet-0f4b91d2c9f64e192"
  tags                                 = {}
  tags_all                             = {}
  tenancy                              = "default"
  user_data                            = null
  user_data_replace_on_change          = null
  volume_tags                          = null
  vpc_security_group_ids               = ["sg-0b7c5d8635b7689d0"]
  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }
  cpu_options {
    core_count       = 1
    threads_per_core = 2
  }
  credit_specification {
    cpu_credits = "unlimited"
  }
  enclave_options {
    enabled = false
  }
  maintenance_options {
    auto_recovery = "default"
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 2
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
