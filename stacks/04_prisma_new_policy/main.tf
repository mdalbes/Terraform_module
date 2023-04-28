module "variables" {
  source = "../../variables"
}

terraform {
  backend "s3" {
    bucket   = "tfstate-bucket-mdalbes-1"
    key      = "tfstate/terraform.tfstate-prisma-new-policy"
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



resource "prismacloud_rql_search" "query_non_web_open" {
    search_type = "config"
    query = "config from cloud.resource where cloud.account = '${module.variables.prisma_aws_account_name_1}' and api.name = 'aws-ec2-describe-security-groups' AND json.rule = ipPermissions[*].toPort is not member of (443,80)"
    time_range {
        relative {
            unit = "day"
            amount = 7
        }
    }
}

resource "prismacloud_saved_search" "saved_query_non_web_open" {
    name = "saved query non web"
    description = "made by terraform"
    search_id = prismacloud_rql_search.query_non_web_open.search_id
    query = prismacloud_rql_search.query_non_web_open.query
    time_range {
        relative {
            unit = prismacloud_rql_search.query_non_web_open.time_range.0.relative.0.unit
            amount = prismacloud_rql_search.query_non_web_open.time_range.0.relative.0.amount
        }
    }
}

resource "prismacloud_policy" "policy_non_web_open" {
    name = module.variables.policy_name
    cloud_type  = "aws"
    policy_type = "config"
    severity    = "critical"
    rule {
        name = "non-web-rule"
        rule_type = "Config"
        criteria = prismacloud_saved_search.saved_query_non_web_open.search_id
        parameters = {
          savedSearch = false
          withIac     = false
        }
        
    }
}