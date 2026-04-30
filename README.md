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

**Terraform functions** 

https://developer.hashicorp.com/terraform/language/functions

**Terraform resources documentation** 

For any resource you want to create just go to that provider in terraform registry 
(Browser providers) -> select providers -> documentation -> search for what you want to create (say ec2 or iam_user) -> copy the resource code done 

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user

**Terraform lifecycle**

- `ignore_changes` 

- `create_before_destroy` 

- `prevent_destroy` 

- `replace_triggered_by` 


**Terraform validation For resources** 

- `precondition `

- `postcondition`

**Terraform state modification** 

- `terraform state list` - lists all resources managed by terraform 

- `terraform state mv oldname newname` - to rename a resource type in existing state file so that terraform wont create a new resource 

- `terraform state show resource_name` - To show the complete details of a resource 
created 

- `terraform state rm resource_name` - To remove a resource from being tracked by terraform then remove the resource code from the terraform files as well 

- `terraform state pull` - To pull the current state from remote backend 

- `terraform state push statefile` - To push local state file to remote backend 

**Terraform import** 

- `terraform import <resourcetype.name> actual_Id_From_Cloud` 


**Terraform workspace** 

- `terraform workspace list` - To List all workspaces 

- `Creating a workspace` - Creating a workspace 

- `terraform workspace select <workspaceName>`  - Selecting a workspace 

- `terraform workspace show` - Showing the current workspace 

- `terraform workspace select default
   terraform workspace delete <workspacename>` - Deleting a workspace

  **Terraform Cloud** 

  https://developer.hashicorp.com/terraform/cli/commands/refresh

  https://developer.hashicorp.com/terraform/language/block/import


  ## Terraform Provisioners 

  Certainly, let's delve deeper into the `file`, `remote-exec`, and `local-exec` provisioners in Terraform, along with examples for each.

1. **file Provisioner:**

   The `file` provisioner is used to copy files or directories from the local machine to a remote machine. This is useful for deploying configuration files, scripts, or other assets to a provisioned instance.

   Example:

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"
     instance_type = "t2.micro"
   }

   provisioner "file" {
     source      = "local/path/to/localfile.txt"
     destination = "/path/on/remote/instance/file.txt"
     connection {
       type     = "ssh"
       user     = "ec2-user"
       private_key = file("~/.ssh/id_rsa")
     }
   }
   ```

   In this example, the `file` provisioner copies the `localfile.txt` from the local machine to the `/path/on/remote/instance/file.txt` location on the AWS EC2 instance using an SSH connection.

2. **remote-exec Provisioner:**

   The `remote-exec` provisioner is used to run scripts or commands on a remote machine over SSH or WinRM connections. It's often used to configure or install software on provisioned instances.

   Example:

   ```hcl
   resource "aws_instance" "example" {
     ami           = "ami-0c55b159cbfafe1f0"
     instance_type = "t2.micro"
   }

   provisioner "remote-exec" {
     inline = [
       "sudo yum update -y",
       "sudo yum install -y httpd",
       "sudo systemctl start httpd",
     ]

     connection {
       type        = "ssh"
       user        = "ec2-user"
       private_key = file("~/.ssh/id_rsa")
       host        = aws_instance.example.public_ip
     }
   }
   ```

   In this example, the `remote-exec` provisioner connects to the AWS EC2 instance using SSH and runs a series of commands to update the package repositories, install Apache HTTP Server, and start the HTTP server.

3. **local-exec Provisioner:**

   The `local-exec` provisioner is used to run scripts or commands locally on the machine where Terraform is executed. It is useful for tasks that don't require remote execution, such as initializing a local database or configuring local resources.

   Example:

   ```hcl
   resource "null_resource" "example" {
     triggers = {
       always_run = "${timestamp()}"
     }

     provisioner "local-exec" {
       command = "echo 'This is a local command'"
     }
   }
   ```

   In this example, a `null_resource` is used with a `local-exec` provisioner to run a simple local command that echoes a message to the console whenever Terraform is applied or refreshed. The `timestamp()` function ensures it runs each time.