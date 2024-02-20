### load balancer target group start ####

variable "tg_name" {
  description = "The name of the target group."
  default     = null
}

variable "tg_name_prefix" {
  description = " Creates a unique name beginning with the specified prefix"
  default     = null
}

variable "port" {
  description = "The port on which targets receive traffic, unless overridden when registering a specific target."
  type        = number
  default     = null
}

variable "protocol" {
  description = "The protocol to use for routing traffic to the targets."
  default     = null
}

variable "vpc_id" {
  description = "The identifier of the VPC in which to create the target group."
  default     = null
}

variable "deregistration_delay" {
  description = "The amount time for Elastic Load Balancing to wait before changing the state of a deregistering target from draining to unused."
  default     = 300
  type        = number
}

variable "load_balancing_algorithm_type" {
  description = "Determines how the load balancer selects targets when routing requests"
  default     = null
}

variable "lambda_multi_value_headers_enabled" {
  description = "Boolean whether the request and response headers exchanged between the load balancer and the Lambda function include arrays of values or strings"
  default     = null
}

variable "proxy_protocol_v2" {
  description = "Boolean to enable / disable support for proxy protocol v2 on Network Load Balancers"
  default     = null
}

variable "stickiness" {
  description = "A Stickiness block. Stickiness blocks are documented below. stickiness is only valid if used with Load Balancers of type Application"
  type        = map(string)
  default     = {}
}

variable "health_check" {
  description = "A Health Check block."
  type        = any
  default     = {}
}

variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group"
  default     = null
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
## load balancer target group end ####