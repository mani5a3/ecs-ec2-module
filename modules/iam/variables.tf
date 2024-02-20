## IAM role start ##
variable "ecs_node_role_name" {
  description = "The name of the role for ecs node"
  default     = null
}

# variable "ecs_task_role_name" {
#   description = "The name of the role for ecs task"
#   default     = null
# }

variable "iam_instance_profile" {
  description = "The name of the instance profile"
  default     = null
}

## IAM role end ##