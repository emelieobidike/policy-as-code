module "policy_assignments" {
  for_each = var.scopes

  source     = "./modules/policy_assignment"
  scope_id   = each.value.scope_id
  scope_type = each.value.scope_type
  assignments = [
    for a in each.value.policy_assignments : {
      name                 = a.name
      policy_definition_id = a.is_custom ? local.policy_definitions[a.policy_key] : a.policy_definition_id
      parameters           = a.parameters
      enforcement          = a.enforcement
    }
  ]
}