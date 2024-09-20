resource "azurerm_resource_group" "rg-alise" {
  name     = "SW-RG"
  location = var.location
}

resource "azurerm_storage_account" "storageaccount-alise" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = azurerm_resource_group.rg-alise.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = var.index_document
  }
}

resource "azurerm_storage_blob" "blob-alise" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storageaccount-alise.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
}
