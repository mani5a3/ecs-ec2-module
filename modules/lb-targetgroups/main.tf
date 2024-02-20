

resource "aws_lb_target_group" "lb_target_group" {
  name                               = var.tg_name
  name_prefix                        = var.tg_name_prefix
  port                               = var.port
  protocol                           = var.protocol
  vpc_id                             = var.vpc_id
  deregistration_delay               = var.deregistration_delay
  load_balancing_algorithm_type      = var.load_balancing_algorithm_type
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  proxy_protocol_v2                  = var.proxy_protocol_v2


  dynamic "stickiness" {
    for_each = var.stickiness == {} ? [] : [var.stickiness]
    content {
      type            = lookup(stickiness.value, "type", "lb_cookie")
      cookie_duration = lookup(stickiness.value, "cookie_duration", null)
      enabled         = lookup(stickiness.value, "enabled", null)
    }
  }

  dynamic "health_check" {
    for_each = var.health_check == {} ? [] : [var.health_check]
    content {
      enabled             = lookup(health_check.value, "enabled", null)
      healthy_threshold   = lookup(health_check.value, "healthy_threshold", null)
      interval            = lookup(health_check.value, "interval", null)
      matcher             = lookup(health_check.value, "matcher", null)
      path                = lookup(health_check.value, "path", null)
      port                = lookup(health_check.value, "port", null)
      protocol            = lookup(health_check.value, "protocol", null)
      timeout             = lookup(health_check.value, "timeout", null)
      unhealthy_threshold = lookup(health_check.value, "unhealthy_threshold", null)
    }
  }

  target_type = var.target_type
  tags        = var.tags

  lifecycle {
    create_before_destroy = true
  }
}