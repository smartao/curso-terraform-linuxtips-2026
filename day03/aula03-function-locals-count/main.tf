module "groundwork" {
  source = "./modules/groundwork"
  cidr_block = "10.1.0.0/16"
}

# Fonte
# https://developer.hashicorp.com/terraform/language/functions
# https://developer.hashicorp.com/terraform/language/functions/cidrsubnet