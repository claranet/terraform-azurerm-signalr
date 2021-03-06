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

  dynamic "features" {
    for_each = var.features
    content {
      flag  = features.value.flag
      value = features.value.value
    }
  }

  tags = merge(local.default_tags, var.extra_tags)
}
