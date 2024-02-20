### load balancer start ### 
variable "lb_name" {
  description = "(Optional) The name of the LB. This name must be unique within your AWS account, can have a maximum of 32 characters, must contain only alphanumeric characters or hyphens, and must not begin or end with a hyphen."
  type        = string
  default     = null
}

variable "lb_name_prefix" {
  description = "(Optional) Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}

variable "internal" {
  description = "(Optional) If true, the LB will be internal."
  default     = false
  type        = bool
}

variable "load_balancer_type" {
  description = "(Optional) The type of load balancer to create."
  type        = string
  default     = "application"
}

variable "security_groups" {
  description = "(Optional) A list of security group IDs to assign to the LB."
  type        = list(string)
  default     = []
}

variable "drop_invalid_header_fields" {
  description = "(Optional) Indicates whether HTTP headers with header fields that are not valid are removed by the load balancer (true) or routed to targets (false)."
  type        = bool
  default     = null
}

variable "access_logs" {
  description = "(Optional) An Access Logs block."
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "(Optional) A list of subnet IDs to attach to the LB."
  type        = list(string)
  default     = []
}

variable "subnet_mapping" {
  description = "(Optional) A subnet mapping block."
  type        = map(string)
  default     = {}
}

variable "idle_timeout" {
  description = "(Optional) The type of IP addresses used by the subnets for your load balancer. "
  type        = number
  default     = null
}

variable "enable_deletion_protection" {
  description = "(Optional) If true, deletion of the load balancer will be disabled via the AWS API."
  default     = false
  type        = bool
}

variable "enable_cross_zone_load_balancing" {
  description = "(Optional) If true, cross-zone load balancing of the load balancer will be enabled."
  default     = false
  type        = bool
}

variable "enable_http2" {
  description = "(Optional) Indicates whether HTTP/2 is enabled in application load balancers"
  default     = true
  type        = bool
}

variable "customer_owned_ipv4_pool" {
  description = "(Optional) The ID of the customer owned ipv4 pool to use for this load balancer."
  type        = string
  default     = null
}

variable "ip_address_type" {
  description = "(Optional) The type of IP addresses used by the subnets for your load balancer."
  type        = string
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
##### load balancer end ######