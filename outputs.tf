output "email_communication_service" {
  value       = azurerm_email_communication_service_domain.this[*].id
  description = "List of email communication service domain IDs."
}

output "email_communication_service_domains" {
  value       = azurerm_email_communication_service_domain.this[*].name
  description = "List of email communication service domain names."

}

output "email_communication_service_domain_sender_username_ids" {
  value       = azurerm_email_communication_service_domain_sender_username.this[*].id
  description = "List of email communication service domain sender usernames."
}