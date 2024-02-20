resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  dynamic "default_action" {
    for_each = var.default_action
    content {
      order            = lookup(default_action.value, "order", null)
      target_group_arn = lookup(default_action.value, "target_group_arn", null)
      type             = default_action.value.type

      dynamic "authenticate_cognito" {
        for_each = lookup(default_action.value, "authenticate_cognito", []) == [] ? [] : [lookup(default_action.value, "authenticate_cognito", [])]
        content {
          authentication_request_extra_params = lookup(authenticate_cognito.value, "authentication_request_extra_params", null)
          on_unauthenticated_request          = lookup(authenticate_cognito.value, "on_unauthenticated_request", null)
          scope                               = lookup(authenticate_cognito.value, "scope", null)
          session_cookie_name                 = lookup(authenticate_cognito.value, "session_cookie_name", null)
          session_timeout                     = lookup(authenticate_cognito.value, "session_timeout", null)
          user_pool_arn                       = authenticate_cognito.value.user_pool_arn
          user_pool_client_id                 = authenticate_cognito.value.user_pool_client_id
          user_pool_domain                    = authenticate_cognito.value.user_pool_domain
        }
      }

      dynamic "authenticate_oidc" {
        for_each = lookup(default_action.value, "authenticate_oidc", []) == [] ? [] : [lookup(default_action.value, "authenticate_oidc", [])]
        content {
          authentication_request_extra_params = lookup(authenticate_oidc.value, "authentication_request_extra_params", null)
          authorization_endpoint              = authenticate_oidc.value.authorization_endpoint
          client_id                           = authenticate_oidc.value.client_id
          client_secret                       = authenticate_oidc.value.client_secret
          issuer                              = authenticate_oidc.value.issuer
          on_unauthenticated_request          = lookup(authenticate_oidc.value, "on_unauthenticated_request", null)
          scope                               = lookup(authenticate_oidc.value, "scope", null)
          session_cookie_name                 = lookup(authenticate_oidc.value, "session_cookie_name", null)
          session_timeout                     = lookup(authenticate_oidc.value, "session_timeout", null)
          token_endpoint                      = authenticate_oidc.value.token_endpoint
          user_info_endpoint                  = authenticate_oidc.value.user_info_endpoint
        }
      }

      dynamic "fixed_response" {
        for_each = lookup(default_action.value, "fixed_response", []) == [] ? [] : [lookup(default_action.value, "fixed_response", [])]
        content {
          content_type = fixed_response.value.content_type
          message_body = lookup(fixed_response.value, "message_body", null)
          status_code  = lookup(fixed_response.value, "status_code", null)
        }
      }

      dynamic "redirect" {
        for_each = lookup(default_action.value, "redirect", []) == [] ? [] : [lookup(default_action.value, "redirect", [])]
        content {
          host        = lookup(redirect.value, "host", null)
          path        = lookup(redirect.value, "path", null)
          port        = lookup(redirect.value, "port", null)
          protocol    = lookup(redirect.value, "protocol", null)
          query       = lookup(redirect.value, "query", null)
          status_code = redirect.value.status_code
        }
      }
    }
  }
}