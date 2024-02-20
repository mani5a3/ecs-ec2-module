## ecs outputs start###
output "ecs_cluster_id" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster."
  value       = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster."
  value       = aws_ecs_cluster.ecs_cluster.arn
}
## ecs outputs end ###