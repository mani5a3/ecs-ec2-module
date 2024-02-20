## load balancer start ###
output "lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.lb.dns_name
}

output "lb_id" {
  description = "The ARN of the load balancer (matches arn)."
  value       = aws_lb.lb.id
}

output "lb_arn" {
  description = "The ARN of the load balancer (matches id)."
  value       = aws_lb.lb.arn
}

output "lb_zone_id" {
  description = "The canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = aws_lb.lb.zone_id
}

output "lb_arn_suffix" {
  description = "The ARN suffix for use with CloudWatch Metrics."
  value       = aws_lb.lb.arn_suffix
}

### load balancer End ###