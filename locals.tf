locals {
  custom_policy_files = fileset("${path.module}/../policies/definitions", "**/*.json")

  custom_policies = {
    for filename in local.custom_policy_files :
    replace(filename, ".json", "") => jsondecode(file("${path.module}/../policies/definitions/${filename}"))
  }
}

module "policy_definitions" {
  source      = "./modules/policy_definition"
  definitions = local.custom_policies
}

locals {
  policy_definitions = module.policy_definitions.ids
}