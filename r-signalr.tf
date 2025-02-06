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
    for_each = var.upstream_endpoint[*]
    content {
      url_template              = upstream_endpoint.value.url_template
      category_pattern          = upstream_endpoint.value.category_pattern
      event_pattern             = upstream_endpoint.value.event_pattern
      hub_pattern               = upstream_endpoint.value.hub_pattern
      user_assigned_identity_id = upstream_endpoint.value.user_assigned_identity_id
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}

moved {
  from = azurerm_signalr_service.signalr
  to   = azurerm_signalr_service.main
}
