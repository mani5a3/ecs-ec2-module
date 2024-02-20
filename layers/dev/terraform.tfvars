
### metadata option to restrict https requests #####
metadata_options = [
  {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
  }
]

block_device_mappings = [
  {
    device_name = "/dev/sda1"
    ebs = {
      volume_size           = 80
      delete_on_termination = true
      volume_type           = "gp3"
      throughput            = 500
    }
  }
]

##### Autoscaling Group
# Autoscaling type of instances configuration 
autoscaling_group_mixed_instances_policy_override = [
  {
    instance_type = "r4.xlarge"
  },
  {
    instance_type = "r4.large"
  },
  {
    instance_type = "m3.xlarge"
  },
  {
    instance_type = "m5.large"
  },
  {
    instance_type = "c3.xlarge"
  },
  {
    instance_type = "c4.xlarge"
  }
]

# Autoscaling moduel spot or on Demand
# For example
# on_demand_base_capacity = 0  will 100% spot and on-demand 0%.
# on_demand_base_capacity = 100 will be 0% sport and 100% on-demand 
autoscaling_group_mixed_instances_policy_instances_distribution = {
  spot_allocation_strategy                 = "capacity-optimized"
  on_demand_base_capacity                  = 100
  on_demand_percentage_above_base_capacity = 0
}

/* ## The number of Amazon EC2 instances that should be running in the group
autoscaling_group_desired_capacity = 1
## The minimum size of the auto scale group
autoscaling_group_min_size = 1
## The maximum size of the auto scale group
autoscaling_group_max_size = 3
## The amount of time, in seconds, after a scaling activity completes before another scaling activity can start.
autoscaling_group_default_cooldown = 0
## Time (in seconds) after instance comes into service before checking health.
autoscaling_group_health_check_grace_period = 0 */


alb_target_group_health_check = {
  healthy_threshold   = 2
  unhealthy_threshold = 2
  interval            = 5
  matcher             = "200"
  path                = "/"
  #port                = "traffic-port"
  protocol = "HTTP"
  timeout  = 3
}

/* #################################################################
##### Autoscalling Policy for Scale up

### The name of the policy
autoscaling_policy_scale_up_name = "scale-up"

### The number of instances by which to scale. adjustment_type determines the interpretation of
### this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size).
### A positive increment adds to the current capacity and a negative value removes from the current capacity.
autoscaling_policy_scale_up_scaling_adjustment = 1

### Specifies whether the adjustment is an absolute number or a percentage of the current capacity.
### Valid values are :
## - ChangeInCapacity
## - ExactCapacity
## - PercentChangeInCapacity
autoscaling_policy_scale_up_adjustment_type = "ChangeInCapacity"

### The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start
autoscaling_policy_scale_up_cooldown = 2


#################################################################
##### Autoscalling Policy for Scale Down

### The name of the policy
autoscaling_policy_scale_down_name = "scale-down"

### The number of instances by which to scale. adjustment_type determines the interpretation of
### this number (e.g., as an absolute number or as a percentage of the existing Auto Scaling group size).
### A positive increment adds to the current capacity and a negative value removes from the current capacity.
autoscaling_policy_scale_down_scaling_adjustment = -1

### Specifies whether the adjustment is an absolute number or a percentage of the current capacity.
### Valid values are :
## - ChangeInCapacity
## - ExactCapacity
## - PercentChangeInCapacity
autoscaling_policy_scale_down_adjustment_type = "ChangeInCapacity"

### The amount of time, in seconds, after a scaling activity completes and before the next scaling activity can start
autoscaling_policy_scale_down_cooldown = 2 */