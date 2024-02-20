#ECS Cluster creation

resource "aws_ecs_cluster" "this" {
  name               = var.ecs_name
  capacity_providers = var.capacity_providers

  dynamic "default_capacity_provider_strategy" {
    for_each = var.default_capacity_provider_strategy
    content {
      base              = lookup(default_capacity_provider_strategy.value, "base", null)
      capacity_provider = default_capacity_provider_strategy.value.capacity_provider
      weight            = lookup(default_capacity_provider_strategy.value, "weight", null)
    }
  }

  tags = var.tags

  dynamic "setting" {
    for_each = var.setting == {} ? [] : [var.setting]
    content {
      name  = setting.value.name
      value = setting.value.value
    }
  }
}


/* # --- ECR ---

resource "aws_ecr_repository" "app" {
  name                 = "demo-app"
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = true
  }
}
*/
/*displaying ecr repo-url*/

/*output "demo_app_repo_url" {
  value = aws_ecr_repository.app.repository_url
}

# --- ECS Task Role ---

*/

resource "aws_ecs_task_definition" "this" {
  family             = "demo-app"
  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_exec_role.arn
  network_mode       = "awsvpc"
  cpu                = 256
  memory             = 256

  container_definitions = jsonencode([{
    name = "app",
    #image        = "${aws_ecr_repository.app.repository_url}:latest",
    image        = "nginx"
    essential    = true,
    portMappings = [{ containerPort = 80, hostPort = 80 }],

    environment = [
      { name = "EXAMPLE", value = "example" }
    ]


  }])
}



resource "aws_ecs_service" "this" {
  name            = "app"
  cluster         = aws_ecs_cluster.this.id
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 2

  network_configuration {
    security_groups = [aws_security_group.this.id]
    subnets         = ["subnet-0f72ee2333a98d9e1", "	subnet-0f04dbf058ba97815", "subnet-0677fec4e6daf19e1"]
    #assign_public_ip = true
  }

  depends_on = [aws_lb_target_group.this]

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = "app"
    container_port   = 80
  }

  capacity_provider_strategy {
    capacity_provider = aws_ecs_capacity_provider.this.name
    base              = 1
    weight            = 100
  }

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }

}