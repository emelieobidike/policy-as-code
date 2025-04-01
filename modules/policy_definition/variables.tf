variable "definitions" {
  type = map(object({
    display_name = string
    mode         = string
    policy_rule  = any
    parameters   = optional(any)
    metadata     = optional(any)
  }))
}