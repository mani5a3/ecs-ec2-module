## security group start ###

variable "sg_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix"
  default     = null
  type        = string
}

variable "sg_name" {
  description = "The name of the security group"
  default     = null
  type        = string
}

variable "description" {
  description = "The security group description. Defaults to Managed by Terraform"
  default     = null
  type        = string
}

variable "ingress" {
  description = "Ingress rules for security group"
  type        = any
  default     = []
}

variable "egress" {
  description = "Egress rules for security group"
  type        = any
  default     = []
}

variable "revoke_rules_on_delete" {
  description = "Instruct Terraform to revoke all of the Security Groups attached ingress and egress rules before deleting the rule itself"
  type        = bool
  default     = false
}

variable "vpc_id" {
  description = "The VPC ID"
  default     = null
  type        = string
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "tag_specifications" {
  description = "The tags to apply to the resources during launch"
  type        = any
  default     = []
}
## security group end ###