variable "scope_type" {
  description = "Scope level: management_group, subscription, or resource_group"
  type        = string
}

locals {
  assignments_map = {
    for a in var.assignments : a.name => a
  }
}

resource "azurerm_management_group_policy_assignment" "mg" {
  for_each = var.scope_type == "management_group" ? local.assignments_map : {}

  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  management_group_id  = var.scope_id
  enforce              = each.value.enforcement
  parameters           = length(keys(each.value.parameters)) > 0 ? jsonencode(each.value.parameters) : null
}

resource "azurerm_subscription_policy_assignment" "sub" {
  for_each = var.scope_type == "subscription" ? local.assignments_map : {}

  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  subscription_id      = var.scope_id
  enforce              = each.value.enforcement
  parameters           = length(keys(each.value.parameters)) > 0 ? jsonencode(each.value.parameters) : null
}

resource "azurerm_resource_group_policy_assignment" "rg" {
  for_each = var.scope_type == "resource_group" ? local.assignments_map : {}

  name                 = each.value.name
  policy_definition_id = each.value.policy_definition_id
  resource_group_id    = var.scope_id
  enforce              = each.value.enforcement
  parameters           = length(keys(each.value.parameters)) > 0 ? jsonencode(each.value.parameters) : null
}