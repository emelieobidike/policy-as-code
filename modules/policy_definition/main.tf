resource "azurerm_policy_definition" "this" {
  for_each = var.definitions

  name         = each.key
  policy_type  = "Custom"
  mode         = each.value.mode
  display_name = each.value.display_name
  policy_rule  = each.value.policy_rule
  parameters   = each.value.parameters
  metadata     = each.value.metadata
}