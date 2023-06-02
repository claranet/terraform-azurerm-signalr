resource "azurerm_signalr_service" "signalr" {
  location            = var.location
  name                = local.name
  resource_group_name = var.resource_group_name
  sku {
    capacity = var.sku.capacity
    name     = var.sku.name
  }

  dynamic "cors" {
    for_each = length(var.allowed_origins) > 0 ? ["fake"] : []
    content {
      allowed_origins = var.allowed_origins
    }
  }

  connectivity_logs_enabled     = var.connectivity_logs_enabled
  messaging_logs_enabled        = var.messaging_logs_enabled
  live_trace_enabled            = var.live_trace_enabled
  service_mode                  = var.service_mode
  public_network_access_enabled = var.public_network_access_enabled

  tags = merge(local.default_tags, var.extra_tags)
}
