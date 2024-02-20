## ecs cluster start  ##
variable "ecs_name" {
  type        = string
  description = "(Required) The name of the cluster (up to 255 letters, numbers, hyphens, and underscores)"
}

variable "capacity_providers" {
  type        = any
  description = "(Optional) List of short names of one or more capacity providers to associate with the cluster."
  default     = []
}

variable "default_capacity_provider_strategy" {
  type        = any
  description = "(Optional) The capacity provider strategy to use by default for the cluster. "
  default     = {}
}


variable "setting" {
  type        = any
  description = "(Optional) Configuration block(s) with cluster settings."
  default     = {}
}

## ecs cluster end ###