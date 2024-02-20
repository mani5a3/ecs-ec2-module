# /*capacity-provider*/

# resource "aws_ecs_capacity_provider" "this" {
#   name = "demo-ecs-ec2"

#   auto_scaling_group_provider {
#     auto_scaling_group_arn         = aws_autoscaling_group.this.arn
#     managed_termination_protection = "DISABLED"

#     managed_scaling {
#       maximum_scaling_step_size = 2
#       minimum_scaling_step_size = 1
#       status                    = "ENABLED"
#       target_capacity           = 100
#     }
#   }
# }

# resource "aws_ecs_cluster_capacity_providers" "this" {
#   cluster_name       = aws_ecs_cluster.this.name
#   capacity_providers = [aws_ecs_capacity_provider.this.name]

#   default_capacity_provider_strategy { /* attaching capacity provider to cluster*/
#     capacity_provider = aws_ecs_capacity_provider.this.name
#     base              = 1
#     weight            = 100
#   }
# }