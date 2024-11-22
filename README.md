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
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.0 |
| null | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_signalr_service.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/signalr_service) | resource |
| [null_resource.signalr_rule](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azurecaf_name.signalr](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allowed\_origins | A List of origins which should be able to make cross-origin calls. | `list(string)` | `[]` | no |
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| connectivity\_logs\_enabled | Specifies if Connectivity Logs are enabled or not. | `bool` | `false` | no |
| custom\_name | Custom name for the SignalR service, generated if not set. | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tag.s | `bool` | `true` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with your autoscale setting. | `map(string)` | `null` | no |
| live\_trace\_enabled | Specifies if Live Trace is enabled or not. | `bool` | `false` | no |
| location | Azure location for App Service Plan. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| messaging\_logs\_enabled | Specifies if Messaging Logs are enabled or not. | `bool` | `false` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| network\_rules | Network Rules to apply to SignalR.<br/>`name` Name of the rule<br/>`rule_type` allowed values are allow or deny<br/>`endpoint` allowed values public-network or the name of the private link<br/>`services` allowed values ["ClientConnection", "ServerConnection", "RESTAPI"] | <pre>list(object({<br/>    name      = string<br/>    rule_type = string<br/>    endpoint  = string<br/>    services  = list(string)<br/>  }))</pre> | `[]` | no |
| public\_network\_access\_enabled | Specifies if the public access is enabled or not. | `bool` | `false` | no |
| resource\_group\_name | Resource group name. | `string` | n/a | yes |
| service\_mode | Specifies the service mode. | `string` | `"Default"` | no |
| sku | Signalr SKU | <pre>object({<br/>    name     = string,<br/>    capacity = number<br/>  })</pre> | <pre>{<br/>  "capacity": 1,<br/>  "name": "Free_F1"<br/>}</pre> | no |
| stack | Project stack name. | `string` | n/a | yes |

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
