module "autoscaling_policy_scale_down" {
  source = "../../modules/asg-policy"

  name                   = "scale-up"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 2
  autoscaling_group_name = module.autoscaling_group.asg_name
}

module "autoscaling_policy_scale_up" {
  source = "../../modules/asg-policy"

  name                   = "scale-down"
  scaling_adjustment     = "-1"
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 2
  autoscaling_group_name = module.autoscaling_group.asg_name
}