variable "scope_id" {
  description = "The scope at which the policy assignments will be applied"
  type        = string
}

variable "assignments" {
  description = "List of policy assignment objects"
  type = list(object({
    name                 = string
    policy_definition_id = string
    parameters           = map(any)
    enforcement          = bool
  }))
}