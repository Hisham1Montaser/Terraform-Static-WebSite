resource "azurerm_resource_group" "rg-alise" {
  name     = "SW-RG"
  location = "eastus"
}

resource "azurerm_storage_account" "storageaccount-alise" {
  name                     = "swbastawisisa"
  resource_group_name      = azurerm_resource_group.rg-alise.name
  location                 = azurerm_resource_group.rg-alise.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "blob-alise" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storageaccount-alise.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "<h1> Hello Hisham, this is a website deployed by using Terrafrom </h1>"
}
