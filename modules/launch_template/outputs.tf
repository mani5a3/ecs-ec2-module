## launch template outputs start ##
output "launch_template_arn" {
  value = aws_launch_template.launch_template.arn
}

output "launch_template_id" {
  value = aws_launch_template.launch_template.id
}

output "launch_template_latest_version" {
  value = aws_launch_template.launch_template.latest_version
}
## launch template outputs end ##