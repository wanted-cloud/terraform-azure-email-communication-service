resource "azurerm_email_communication_service_domain_sender_username" "this" {
  for_each = {
    for user in flatten({ for service in var.service_domains :
      service.name => [
        for sender in service.sender_usernames : {
          domain_name                      = service.name
          sender_name                      = sender.name
          display_name                     = sender.display_name
          domain_management                = service.domain_management
          user_engagement_tracking_enabled = service.user_engagement_tracking_enabled
          tags                             = service.tags
        }
    ] }) : "${user.domain_name}-${user.sender_name}" => user
  }
  name                    = each.value.sender_name
  display_name            = each.value.display_name
  email_service_domain_id = azurerm_email_communication_service_domain.this[each.value.domain_name]["id"]

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain_sender_username"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain_sender_username"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain_sender_username"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_email_communication_service_domain_sender_username"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}