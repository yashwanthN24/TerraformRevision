# TerraformRevision

**Getting started** 

- Terraform is a IAC Tool that uses HCL hasicorp Corporation language templating language 

**Installation** 

https://developer.hashicorp.com/terraform/install


**AWS CLI** 

- Install aws cli from here 

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

- Then configure aws cli to connect to your aws account via 

`aws configure` 

https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html

**Providers** 

- Terraform provides multiple providers on which we can provision infrastructure 
- Ex: AWS , Azure , GCP , Oracle Cloud , etc ... 

You find the list of all providers terraform supports here : 

https://registry.terraform.io/browse/providers?product_intent=terraform

**Resources** 

- Each thing you create in infrastructure is called a resource be it vpc , subnet or even EC2 Instance

https://developer.hashicorp.com/terraform/language/resources

**Variables** 

- Can be resued across different .tf files within the same module 

**Input Variables**

```terraform 

variable region {
     description = "EC2 instance type for the web server"
     default     = "t2.micro" # optional if you want to pass it via .tfvars file
     type        = string # optional 
}
```

https://developer.hashicorp.com/terraform/language/values/variables

**Output Blocks** 

- Lets you would some values as acknowledgement after your resource creation we can use output blocks for this 

```terraform 


output "instance_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.web.private_ip
}

```

https://developer.hashicorp.com/terraform/language/values/outputs

https://developer.hashicorp.com/terraform/language/values/locals

**Terraform modules** 

- Modules allow you to reuse existing infrstaructe resources provided different variable and reusing existing created resources within a team or organization or across world 

https://developer.hashicorp.com/terraform/language/modules

https://registry.terraform.io/?product_intent=terraform

Prebuilt publicly available modules for you to use like maybe vpc or eks cluster ready made modules availabe you can use them 

https://registry.terraform.io/browse/modules

https://registry.terraform.io/modules/terraform-aws-modules/iam/aws/latest/submodules/iam-user

**Random Provider** 


https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id

```bash 

resource "random_id" "server" {
  byte_length = 8
}


output "id" {
  value = random_id.server.dec
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "bucket-${random_id.server.dec}" 
}

```

