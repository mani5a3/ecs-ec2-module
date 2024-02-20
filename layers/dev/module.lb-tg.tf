module "lb_target_group" {
  source = "../../modules/lb-targetgroups"


  # ALB Target Group
  tg_name_prefix       = "ecstg"
  port                 = 8080
  protocol             = "HTTP"
  vpc_id               = "vpc-0b9c545b11edadb10"
  deregistration_delay = 0
  health_check         = var.alb_target_group_health_check

  /*   tags = merge(
    var.common_tags,
    {
      env                 = "${var.trips_env[terraform.workspace]}"
      Name                = "${var.source_market_name}-${var.environment}-rabbitmq-alb-tg"
      applicationcategory = "${var.application_service}-alb-tg"
      application_service = var.application_service
      service             = "LoadBalancers"
      "map-migrated"      = "${var.map_credits["mapmigrated"]}"
      crowdstrike_exclude = var.crowdstrike_exclude
    }
  ) */
}