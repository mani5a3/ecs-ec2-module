
## load balancer listeners start###
variable "load_balancer_arn" {
  description = "The ARN of the load balancer."
}

variable "port" {
  description = "The port on which the load balancer is listening."
  type        = number
}

variable "protocol" {
  description = "The protocol for connections from clients to the load balancer."
  default     = null
}

variable "ssl_policy" {
  description = "he name of the SSL Policy for the listener."
  default     = null
}

variable "certificate_arn" {
  description = "The ARN of the default SSL server certificate"
  default     = null
}

variable "default_action" {
  description = "An Action block"
  default     = []
  type        = any
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
##### load balancer listeners end ###