resource "azurerm_email_communication_service_domain" "this" {
  for_each = { for service in var.var.service_domains : service.name => service }

  name             = each.value.name
  email_service_id = azurerm_email_communication_service.this.id

  domain_management = each.value.domain_management

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}