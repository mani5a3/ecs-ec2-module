# This module deploys Autoscalling Group RabbitMQ Cluster

module "autoscaling_group" {
  source = "../../modules/asg"

  asg_name_prefix  = "ecs-asg-cluster-"
  desired_capacity = 1
  max_size         = 2
  min_size         = 1
  default_cooldown = 0
  #vpc_zone_identifier       = ["${local.subnet_id}"]
  vpc_zone_identifier       = ["subnet-07677d22984d90389"]
  health_check_grace_period = 0

  target_group_arns = [
    module.lb_target_group.lb_target_group_arn
  ]

  mixed_instances_policy = {
    launch_template = {
      launch_template_specification = {
        launch_template_id = module.launch_template.launch_template_id
        version            = "$Latest"
      }
      override = var.autoscaling_group_mixed_instances_policy_override
    }
    instances_distribution = var.autoscaling_group_mixed_instances_policy_instances_distribution
  }

  /*   tag = merge(
    var.common_tags,
    {
      env         = "${var.trips_env[terraform.workspace]}"
      Name                = "${var.source_market_name}-${var.environment}-rabbitmq-cluster-nodes"
      applicationcategory = "${var.application_service}-server"
      application_service = var.application_service
      service             = "Autoscaling"
      "account" = "${var.account_environment[terraform.workspace]}"
      "map-migrated"        = "${var.map_credits["mapmigrated"]}"
      crowdstrike_exclude  = var.crowdstrike_exclude
    }
  ) */
}