output "asg_policy_arn" {
  value = aws_autoscaling_policy.autoscaling_policy.arn
}

output "asg_policy_name" {
  value = aws_autoscaling_policy.autoscaling_policy.name
}

output "adjustment_type" {
  value = aws_autoscaling_policy.autoscaling_policy.adjustment_type
}

output "sg_policy_type" {
  value = aws_autoscaling_policy.autoscaling_policy.policy_type
}