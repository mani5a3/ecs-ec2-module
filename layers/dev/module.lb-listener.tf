module "lb_listener" {
  source = "../../modules/lb-listeners"

  # ALB Listener
  load_balancer_arn = module.lb.lb_arn
  port              = 80
  protocol          = "HTTP"
  #   ssl_policy        = var.alb_listener_ssl_policy
  #   certificate_arn   = var.alb_listener_certificate_arn

  default_action = [
    {
      type             = "forward"
      target_group_arn = module.lb_target_group.lb_target_group_arn
    }
  ]
}