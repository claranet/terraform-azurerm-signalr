resource "azurerm_signalr_service" "main" {
  location            = var.location
  name                = local.name
  resource_group_name = var.resource_group_name
  sku {
    capacity = var.sku.capacity
    name     = var.sku.name
  }

  dynamic "cors" {
    for_each = length(var.allowed_origins) > 0 ? ["enabled"] : []
    content {
      allowed_origins = var.allowed_origins
    }
  }

  live_trace {
    enabled                   = var.live_trace.enabled
    messaging_logs_enabled    = var.live_trace.messaging_logs_enabled
    connectivity_logs_enabled = var.live_trace.connectivity_logs_enabled
    http_request_logs_enabled = var.live_trace.http_request_logs_enabled
  }
  service_mode                  = var.service_mode
  public_network_access_enabled = var.public_network_access_enabled

  dynamic "upstream_endpoint" {
    for_each = var.upstream_endpoint != null ? ["enabled"] : []
    content {
      url_template              = var.upstream_endpoint.url_template
      category_pattern          = var.upstream_endpoint.category_pattern
      event_pattern             = var.upstream_endpoint.event_pattern
      hub_pattern               = var.upstream_endpoint.hub_pattern
      user_assigned_identity_id = var.upstream_endpoint.user_assigned_identity_id
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}

moved {
  from = azurerm_signalr_service.signalr
  to   = azurerm_signalr_service.main
}
