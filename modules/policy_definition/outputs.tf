output "ids" {
  value = {
    for k, v in azurerm_policy_definition.this :
    k => v.id
  }
}