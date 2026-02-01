module "projetoa" {
  source      = "./instancias"
  nome        = "projetoA"
  environment = "Production"
}

# Fonte
# https://developer.hashicorp.com/terraform/language/modules
# https://developer.hashicorp.com/terraform/language/modules/configuration