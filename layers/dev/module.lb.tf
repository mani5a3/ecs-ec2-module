module "lb" {
  source = "../../modules/load-balancer"


  lb_name                    = "ecs-alb"
  internal                   = false
  security_groups            = [module.security-group.sg_id]
  subnets                    = ["subnet-07677d22984d90389", "subnet-092bcd794535c2e59"]
  drop_invalid_header_fields = false
  enable_deletion_protection = false

  /*   tags = merge(
    var.common_tags,
    {
      env                 = "${var.trips_env[terraform.workspace]}"
      Name                = "${var.source_market_name}-${var.environment}-rabbitmq-alb"
      applicationcategory = "${var.application_service}-alb"
      application_service = var.application_service
      service             = "LoadBalancers"
      "map-migrated"      = "${var.map_credits["mapmigrated"]}"
      crowdstrike_exclude = var.crowdstrike_exclude
    }
  ) */
}