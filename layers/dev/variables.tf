variable "block_device_mappings" {
  description = "Specify volumes to attach to the instance besides the volumes specified by the AMI."
  type        = any
  default     = []
}

variable "metadata_options" {
  description = "Customize the metadata options for the instance"
  default     = {}
  type        = any
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


variable "autoscaling_group_mixed_instances_policy_override" {
  description = "Configuration block containing settings to define launch targets for Auto Scaling groups"
  type        = any
}

variable "autoscaling_group_mixed_instances_policy_instances_distribution" {
  description = " Nested argument containing settings on how to mix on-demand and Spot instances in the Auto Scaling group."
  type        = any
}

variable "alb_target_group_health_check" {
  description = "A Health Check block"
  type        = any
}