variable "sku" {
  description = "SignalR SKU."
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

variable "connectivity_logs_enabled" {
  description = "Specifies if Connectivity Logs are enabled or not."
  type        = bool
  default     = false
}

variable "messaging_logs_enabled" {
  description = "Specifies if Messaging Logs are enabled or not."
  type        = bool
  default     = false
}

variable "live_trace_enabled" {
  description = "Specifies if Live Trace is enabled or not."
  type        = bool
  default     = false
}

variable "service_mode" {
  description = "Specifies the service mode."
  type        = string
  default     = "Default"
}

variable "public_network_access_enabled" {
  description = "Specifies if the public access is enabled or not."
  type        = bool
  default     = false
}

variable "upstream_endpoint" {
  description = "Specifies the upstream endpoint for SignalR. For arguements please refer to [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/signalr_service#upstream_endpoint-4)"
  type = object({
    url_template              = optional(string, "")
    category_pattern          = optional(list(string), ["*"])
    event_pattern             = optional(list(string), ["*"])
    hub_pattern               = optional(list(string), ["*"])
    user_assigned_identity_id = optional(string)
  })
  default = {}
}

# Signalr network rules
variable "default_action" {
  description = "The default action to control the network access when no other rule matches. Possible values are `Allow` and `Deny`."
  type        = string
  default     = "Deny"
}

variable "allowed_request_types" {
  description = "The allowed request types for the public network. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Allow`, `allowed_request_types` cannot be set."
  type        = list(string)
  default     = null
}

variable "denied_request_types" {
  description = "The denied request types for the public network. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Deny`, `denied_request_types` cannot be set."
  type        = list(string)
  default     = null
}

variable "private_endpoint_id" {
  description = "The ID of the Private Endpoint."
  type        = string
  default     = null
}

variable "private_endpoint_allowed_request_types" {
  description = "The allowed request types for the Private Endpoint Connection. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Allow`, `allowed_request_types` cannot be set."
  type        = list(string)
  default     = null
}

variable "private_endpoint_denied_request_types" {
  description = "The denied request types for the Private Endpoint Connection. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Deny`, `denied_request_types` cannot be set."
  type        = list(string)
  default     = null
}
