
module "variables" {
  source = "../../variables"
}

terraform {
  backend "s3" {
    bucket   = "tfstate-bucket-mdalbes"
    key      = "tfstate/terraform.tfstate-prisma-alert-rule"
    region   = "us-east-1"

  }
}

terraform {
  required_providers {
    prismacloud = {
      source = "PaloAltoNetworks/prismacloud"
      version = ">=1.1.0"
    }
  }
}

provider "prismacloud" {
    json_config_file = "prismacloud_auth.json"
}


data "prismacloud_account_group" "existing_account_group_id" {
    name = module.variables.existing_account_group_name_1 // Change the account group name, if you already have an account group that you wish to map the account. 
}


data "prismacloud_policy" "non_web" {
    name = module.variables.policy_name
}

resource "prismacloud_alert_rule" "alert_rule_1" {
    name = "mdalbes-non-web-port-open-alert"
    description = "Made by Terraform"
    allow_auto_remediate = false
    policies = ["${data.prismacloud_policy.non_web.policy_id}"]
    target  {
        account_groups = [data.prismacloud_account_group.existing_account_group_id.group_id]
    }
    
    notification_config  {
        config_type = "email" 
        recipients = ["mdalbes@paloaltonetworks.com"]
    }
}


