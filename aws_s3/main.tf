terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.42.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.8.1"
    }
  }
}

provider "aws" {
  
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "bucket-${random_id.server.dec}" 
}

# random provider to generate random id 
resource "random_id" "server" {
  byte_length = 8
}


# This copies an file from local to s3 bucket
resource "aws_s3_object" "name" {
  bucket = aws_s3_bucket.bucket1.bucket
  key = "mydata.txt" 
  source = "./file.txt" 
}

output "id" {
  value = random_id.server.dec
}