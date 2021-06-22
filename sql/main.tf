resource "azurerm_mysql_server" "main" {
  name                = "${var.project_name}-server"
  location            = var.location
  resource_group_name = var.group_name

  administrator_login          = var.sql_user
  administrator_login_password = var.sql_password

  sku_name   = "B_Gen5_2"
  storage_mb = "5120"
  version    = "5.7"

  ssl_enforcement_enabled = true


}
resource "azurerm_mysql_database" "main" {
  name                = "${var.project_name}-db"
  resource_group_name = var.group_name
  server_name         = azurerm_mysql_server.main.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}