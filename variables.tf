variable "client_name" {
  description = "Client name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "stack" {
  description = "Stack name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure location for App Service Plan."
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "name_prefix" {
  description = "Name prefix for all resources generated name"
  type        = string
  default     = ""
}

variable "custom_name" {
  description = "Custom name for signalr service. Autogenerated if empty"
  type        = string
  default     = null
}

variable "sku" {
  description = "Signalr SKU"
  type = object({
    name     = string,
    capacity = number
  })
  default = {
    name     = "Free_F1"
    capacity = 1
  }
}

variable "allowed_origins" {
  description = "A List of origins which should be able to make cross-origin calls."
  type        = list(string)
  default     = []
}

variable "features" {
  description = "Signalr features to enable"
  type = list(object({
    flag  = string,
    value = string
  }))
  default = []
}

variable "network_rules" {
  description = <<EOD
Network Rules to apply to SignalR.
`name` Name of the rule
`rule_type` allowed values are allow or deny
`endpoint` allowed values public-network or the name of the private link
`allowed_services` allowed values ["ClientConnection", "ServerConnection", "RESTAPI"]
EOD
  type = list(object({
    name      = string
    rule_type = string
    endpoint  = string
    services  = list(string)
  }))
  default = []
}
