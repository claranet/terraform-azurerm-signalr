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

variable "network_rules" {
  description = <<EOD
Network Rules to apply to SignalR.
`name` Name of the rule
`rule_type` allowed values are allow or deny
`endpoint` allowed values public-network or the name of the private link
`services` allowed values ["ClientConnection", "ServerConnection", "RESTAPI"]
EOD
  type = list(object({
    name      = string
    rule_type = string
    endpoint  = string
    services  = list(string)
  }))
  default = []
}

variable "connectivity_logs_enabled" {
  description = "Specifies if Connectivity Logs are enabled or not"
  type        = bool
  default     = false
}

variable "messaging_logs_enabled" {
  description = "Specifies if Messaging Logs are enabled or not"
  type        = bool
  default     = false
}

variable "live_trace_enabled" {
  description = "Specifies if Live Trace is enabled or not"
  type        = bool
  default     = false
}

variable "service_mode" {
  description = "Specifies the service mode"
  type        = string
  default     = "Default"
}

variable "public_network_access_enabled" {
  description = "Specifies if the public access is enabled or not."
  type        = bool
  default     = false
}
