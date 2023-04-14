#############################################################
####################  provider  #############################
#############################################################

variable "region" {
  type = string
  default = "us-east-1"
}
output "region" {
  value = var.region
}

variable "username" {
  type = string
  default = "acloudguru"
}
output "username" {
  value = var.username
}

#############################################################
################     Remote_state      ######################
#############################################################


variable "tfstate_bucket_name" {
  type    = string
  default = "tfstate-bucket-mdalbes-1"
}

output "tfstate_bucket_name" {
  value = var.tfstate_bucket_name
}


variable "dynamodb_name" {
  type    = string
  default = "tfstate-dynamodb-mdalbes-1"
}

output "dynamodb_name" {
  value = var.dynamodb_name
}


#############################################################
######################   VPC   ##############################
#############################################################

variable "vpc_cidrs" {
  type = string
  default = "10.0.0.0/16"   
  }


output "vpc_cidrs" {
  value = var.vpc_cidrs
}
variable "vpc_name" {
  type = string
  default = "Terraform_module_VPC"   
  }


output "vpc_name" {
  value = var.vpc_name
}
 
variable "az_list" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}


output "az_list" {
  value = var.az_list
}

variable "short_az_list" {
  type    = list(string)
  default = ["a","b"]
}

output "short_az_list" {
  value = var.short_az_list
}

variable "log_group_name" {
  type    = string
  default = "vpc01_loggroups"
}

output "log_group_name" {
  value = var.log_group_name
}


#############################################################
####################   SUBNETS   ############################
#############################################################

variable "private_subnet_cidrs" {
  type = map
  default = {
    compute = ["10.0.2.0/24", "10.0.3.0/24"]  
    database  = ["10.0.4.0/24", "10.0.5.0/24"]
  }
}

output "private_subnet_cidrs" {
  value = var.private_subnet_cidrs
}

variable "public_subnets" {
  type = list(string)
  default = ["10.0.0.0/24","10.0.1.0/24"]
}

output "public_subnets" {
  value = var.public_subnets
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

output "public_subnet_suffix" {
  value = var.public_subnet_suffix
}

variable "public_subnet_name" {
  description = "Name to append to public subnets name"
  type        = string
  default     = ""
}

output "public_subnet_name" {
  value = var.public_subnet_name
}



#############################################################
####################   Instances   ##########################
#############################################################

variable "key_name" {
  description = "Name of the Instance keyname"
  type        = string
  default     = "mdalbes-instance"
}

output "key_name" {
  value = var.key_name
}



variable "filename" {
  description = "pem Path"
  type        = string
  default     = "C:\\Users\\mdalbes\\Desktop\\repo\\Terraform_module\\mdalbes-instance.pem"
}

output "filename" {
  value = var.filename
}

variable "myIP" {
  description = "myIP"
  type        = string
  default     = "35.181.28.86/32"
}

output "myIP" {
  value = var.myIP
}

