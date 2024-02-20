output "role_id" {
  description = "The name of the role."
  value       = aws_iam_role.ecs_node_role.id
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.ecs_node_role.arn
}

output "role_name" {
  description = "The name of the role."
  value       = aws_iam_role.ecs_node_role.name
}

output "instance_profile_name" {
  description = "The name of the role."
  value       = aws_iam_instance_profile.this.name
}