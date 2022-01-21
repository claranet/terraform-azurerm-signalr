# Azure SignalR Service
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/signalr/azurerm/)

This terraform module creates an [Azure SignalR service](https://azure.microsoft.com/en-us/services/signalr-service/) and its associated Network Rules when needed.
[Diagnostic settings](https://docs.microsoft.com/en-us/azure/diagnostics) are also deployed.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 5.x.x       | 0.15.x & 1.0.x    | >= 2.0          |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "signalr" {
  source  = "claranet/signalr/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short
  resource_group_name = module.rg.resource_group_name

  sku = {
    name     = "Standard_S1"
    capacity = 1
  }

  network_rules = [
    {
      name      = "AllowClientConnection"
      rule_type = "allow"
      endpoint  = "public-network"
      services  = ["ClientConnection"]
    },
    {
      name      = "DenyAllOthers"
      rule_type = "deny"
      endpoint  = "public-network"
      services  = ["ServerConnection", "RESTAPI"]
    }
  ]
}

```

## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.90 |
| null | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_signalr_service.signalr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/signalr_service) | resource |
| [null_resource.signalr_rule](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_origins | A List of origins which should be able to make cross-origin calls. | `list(string)` | `[]` | no |
| client\_name | Client name | `string` | n/a | yes |
| connectivity\_logs\_enabled | Specifies if Connectivity Logs are enabled or not | `bool` | `false` | no |
| custom\_name | Custom name for signalr service. Autogenerated if empty | `string` | `null` | no |
| environment | Environment name | `string` | n/a | yes |
| extra\_tags | Tags to add to the resource | `map(string)` | `null` | no |
| live\_trace\_enabled | Specifies if Live Trace is enabled or not | `bool` | `false` | no |
| location | Azure location for App Service Plan. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| messaging\_logs\_enabled | Specifies if Messaging Logs are enabled or not | `bool` | `false` | no |
| name\_prefix | Name prefix for all resources generated name | `string` | `""` | no |
| network\_rules | Network Rules to apply to SignalR.<br>`name` Name of the rule<br>`rule_type` allowed values are allow or deny<br>`endpoint` allowed values public-network or the name of the private link<br>`services` allowed values ["ClientConnection", "ServerConnection", "RESTAPI"] | <pre>list(object({<br>    name      = string<br>    rule_type = string<br>    endpoint  = string<br>    services  = list(string)<br>  }))</pre> | `[]` | no |
| resource\_group\_name | Resource group name | `string` | n/a | yes |
| service\_mode | Specifies the service mode | `string` | `"Default"` | no |
| sku | Signalr SKU | <pre>object({<br>    name     = string,<br>    capacity = number<br>  })</pre> | <pre>{<br>  "capacity": 1,<br>  "name": "Free_F1"<br>}</pre> | no |
| stack | Stack name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| hostname | The FQDN of the SignalR service |
| id | The ID of the SignalR service. |
| primary\_access\_key | The primary access key for the SignalR service. |
| primary\_connection\_string | The primary connection string for the SignalR service. |
| public\_port | The publicly accessible port of the SignalR service which is designed for browser/client use. |
| secondary\_access\_key | The secondary access key for the SignalR service. |
| secondary\_connection\_string | The secondary connection string for the SignalR service. |
| server\_port | The publicly accessible port of the SignalR service which is designed for customer server side use. |
<!-- END_TF_DOCS -->
## Related documentations

  * [SignalR Documentation](https://docs.microsoft.com/en-us/azure/azure-signalr/signalr-overview)
  * [Network Rules cli options](https://docs.microsoft.com/en-us/cli/azure/signalr/network-rule?view=azure-cli-latest)
