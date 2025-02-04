# Azure SignalR Service
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/signalr/azurerm/)

This terraform module creates an [Azure SignalR service](https://azure.microsoft.com/en-us/services/signalr-service/) and its associated Network Rules when needed.
[Diagnostic settings](https://docs.microsoft.com/en-us/azure/diagnostics) are also deployed.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
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

  allowed_request_types = ["ClientConnection"]
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_signalr_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/signalr_service) | resource |
| [azurerm_signalr_service_network_acl.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/signalr_service_network_acl) | resource |
| [azurecaf_name.signalr](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_origins | A List of origins which should be able to make cross-origin calls. | `list(string)` | `[]` | no |
| allowed\_request\_types | The allowed request types for the public network. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Allow`, `allowed_request_types` cannot be set. | `list(string)` | `null` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| custom\_name | Custom name for the SignalR service, generated if not set. | `string` | `""` | no |
| default\_action | The default action to control the network access when no other rule matches. Possible values are `Allow` and `Deny`. | `string` | `"Deny"` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| denied\_request\_types | The denied request types for the public network. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Deny`, `denied_request_types` cannot be set. | `list(string)` | `null` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with your autoscale setting. | `map(string)` | `null` | no |
| live\_trace | Specifies if Live Trace is enabled or not. | <pre>object({<br/>    enabled                   = optional(bool, false)<br/>    messaging_logs_enabled    = optional(bool, false)<br/>    connectivity_logs_enabled = optional(bool, false)<br/>    http_request_logs_enabled = optional(bool, false)<br/>  })</pre> | `{}` | no |
| location | Azure location for App Service Plan. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| private\_endpoint\_allowed\_request\_types | The allowed request types for the Private Endpoint Connection. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Allow`, `allowed_request_types` cannot be set. | `list(string)` | `null` | no |
| private\_endpoint\_denied\_request\_types | The denied request types for the Private Endpoint Connection. Possible values are `ClientConnection`, `ServerConnection`, `RESTAPI` and `Trace`. When `default_action` is `Deny`, `denied_request_types` cannot be set. | `list(string)` | `null` | no |
| private\_endpoint\_id | The ID of the Private Endpoint. | `string` | `null` | no |
| public\_network\_access\_enabled | Specifies if the public access is enabled or not. | `bool` | `false` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| service\_mode | Specifies the service mode. | `string` | `"Default"` | no |
| sku | SignalR SKU. | <pre>object({<br/>    name     = string,<br/>    capacity = number<br/>  })</pre> | <pre>{<br/>  "capacity": 1,<br/>  "name": "Free_F1"<br/>}</pre> | no |
| stack | Project stack name. | `string` | n/a | yes |
| upstream\_endpoint | Specifies the upstream endpoint for SignalR. For arguements please refer to [documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/signalr_service#upstream_endpoint-4) | <pre>object({<br/>    url_template              = optional(string, "")<br/>    category_pattern          = optional(list(string), ["*"])<br/>    event_pattern             = optional(list(string), ["*"])<br/>    hub_pattern               = optional(list(string), ["*"])<br/>    user_assigned_identity_id = optional(string)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| hostname | The FQDN of the SignalR service. |
| id | The ID of the SignalR service. |
| primary\_access\_key | The primary access key for the SignalR service. |
| primary\_connection\_string | The primary connection string for the SignalR service. |
| public\_port | The publicly accessible port of the SignalR service which is designed for browser/client use. |
| resource | Azure SignalR service object. |
| secondary\_access\_key | The secondary access key for the SignalR service. |
| secondary\_connection\_string | The secondary connection string for the SignalR service. |
| server\_port | The publicly accessible port of the SignalR service which is designed for customer server side use. |
<!-- END_TF_DOCS -->
## Related documentations

  * [SignalR Documentation](https://docs.microsoft.com/en-us/azure/azure-signalr/signalr-overview)
  * [Network Rules cli options](https://docs.microsoft.com/en-us/cli/azure/signalr/network-rule?view=azure-cli-latest)
