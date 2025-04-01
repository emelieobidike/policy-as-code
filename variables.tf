variable "scopes" {
  description = "Map of all scopes (mg, sub, rg) and their policy assignments"
  type = map(object({
    scope_type = string
    scope_id   = string
    policy_assignments = list(object({
      name                 = string
      policy_definition_id = optional(string)
      policy_key           = optional(string)
      is_custom            = optional(bool, false)
      parameters           = map(any)
      enforcement          = bool
    }))
  }))
}