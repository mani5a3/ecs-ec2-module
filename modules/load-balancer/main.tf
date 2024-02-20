resource "aws_lb" "lb" {
  name                       = var.lb_name
  name_prefix                = var.lb_name_prefix
  internal                   = var.internal
  load_balancer_type         = var.load_balancer_type
  security_groups            = var.security_groups
  drop_invalid_header_fields = var.drop_invalid_header_fields

  dynamic "access_logs" {
    for_each = var.access_logs
    content {
      bucket  = access_logs.value.bucket
      enabled = lookup(access_logs.value, "enabled", null)
      prefix  = lookup(access_logs.value, "prefix", null)
    }
  }

  subnets = var.subnets

  dynamic "subnet_mapping" {
    for_each = var.subnet_mapping
    content {
      subnet_id     = lookup(subnet_mapping.value, "subnet_id", null)
      allocation_id = lookup(subnet_mapping.value, "allocation_id", null)
    }
  }

  idle_timeout                     = var.idle_timeout
  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = var.enable_http2
  customer_owned_ipv4_pool         = var.customer_owned_ipv4_pool
  ip_address_type                  = var.ip_address_type
  tags                             = var.tags

  lifecycle {
    create_before_destroy = true
  }
}