# Terraform_module
How to use module in Terraform, here is an example of a VPC with VPC flowlogs activated and 2 EC2 Instances


# Design
![Screenshot](terraform_module_design.drawio.png)

# Requirements
1°) Install Terraform
2°) Go ACloudGuru through Okta => Playground => Start AWS Sandbox
3°) Modify you credentials file with your access key secret key for [default] and create the same with [acloudguru]
4°) Create your own .pem key in repository "Terraform_module"
5°) In your file variables.tf ==> Modify variables "tfstate_bucket_name" , "dynamodb_name", "key_name", "filename", "myIP" with your own value.



# Deployement
1°)  Remote state
go to Terraform_module/stacks/00_remote_state
terraform init
terraform plan 
terraform apply -auto-approve

2°) VPC
cd ../01_vpc
terraform init
terraform plan 
terraform apply -auto-approve

3°) EC2
cd ../02_ec2
terraform init
terraform plan 
terraform apply -auto-approve

# Generate logs between Instance
connect through ssh to instance 1, and try to ping / nmap / ssh to Instance2 
