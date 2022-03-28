output "api_url" {
  value = "https://${azurerm_function_app.main.default_hostname}/api/my-function-app"
}

output "webapp_storage_account_name" {
  value = azurerm_storage_account.webapp.name
}

output "webapp_access_key" {
  sensitive   = true
  value       = azurerm_storage_account.webapp.primary_access_key
  description = "WebApp storage account primary access key"
}

output "webapp_endpoint" {
  value = azurerm_storage_account.webapp.primary_web_endpoint
}
