resource "azurerm_signalr_service_network_acl" "main" {
  signalr_service_id = azurerm_signalr_service.main.id
  default_action     = var.default_action

  public_network {
    allowed_request_types = var.allowed_request_types
    denied_request_types  = var.denied_request_types
  }

  private_endpoint {
    id                    = var.private_endpoint_id
    allowed_request_types = var.private_endpoint_allowed_request_types
    denied_request_types  = var.private_endpoint_denied_request_types
  }
}
