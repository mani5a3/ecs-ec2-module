## security group start ###

output "sg_id" {
  description = "The ID of the security group"
  value       = aws_security_group.security_group.id
}

output "sg_arn" {
  description = "The ARN of the security group"
  value       = aws_security_group.security_group.arn
}

output "sg_name" {
  description = "The VPC ID."
  value       = aws_security_group.security_group.name
}

### security group end #### 