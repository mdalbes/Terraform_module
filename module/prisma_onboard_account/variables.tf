variable "name" {
  description = "Name to be used on Prisma UI for account name"
  type        = string
  default     = "myAwsAccountName"
}

variable "aws_account_id" {
  description = "Account ID onboarded"
  type        = string
  default     = ""
}


variable "existing_account_group_name" {
  description = "Account group Name"
  type        = string
  default     = "Default Account Group"
}