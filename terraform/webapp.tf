resource "azurerm_storage_account" "webapp" {
  name                      = "web${local.uuid}"
  resource_group_name       = azurerm_resource_group.main.name
  location                  = azurerm_resource_group.main.location
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = true
  static_website {
    index_document     = "index.html"
    error_404_document = "index.html"
  }
  tags = {}
}
