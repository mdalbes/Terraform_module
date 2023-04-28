
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

resource "prismacloud_alert_rule" "alert_rule_1" {
    name = "mdalbes-non-web-port-open-alert"
    description = "Made by Terraform"
    target  {
        account_groups = [module.variables.existing_account_group_name_1]
        # resource_list  {
        #   compute_access_group_ids = ["Sockshop"]
        # }
    }
    policies = [module.variables.policy_name]
    notification_config  {
        config_type = "email"  
    }
}


