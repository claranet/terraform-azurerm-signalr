module "signalr" {
  source  = "claranet/signalr/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.name

  sku = {
    name     = "Standard_S1"
    capacity = 1
  }

  public_network {
    allowed_request_types = ["ClientConnection"]
  }
}
