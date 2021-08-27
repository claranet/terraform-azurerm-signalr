data "azurerm_subscription" "current" {}

resource "null_resource" "signalr_rule" {
  for_each = { for rule in var.network_rules : rule.name => rule }
  triggers = {
    rule_name = each.value.name
    rule_type = each.value.rule_type
    endpoint  = each.value.endpoint
    services  = join(",", each.value.services)

  }
  provisioner "local-exec" {
    command = <<EOC
az signalr network-rule update \
  --${each.value.rule_type} ${join(" ", each.value.services)} \
  ${each.value.endpoint == "public-network" ? "--public-network" : format("--connection-name %s", each.value.endpoint)} \
  --name ${azurerm_signalr_service.signalr.name} \
  --resource-group ${azurerm_signalr_service.signalr.resource_group_name} \
  --subscription ${data.azurerm_subscription.current.subscription_id}
EOC
  }
}
