resource "azurerm_resource_group" "base" {
  name     = var.resource_group_info.name
  location = var.resource_group_info.location

}


resource "azurerm_kubernetes_cluster" "base" {
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  name                = var.aks_info.name
  dns_prefix          = "Aksdns"
  default_node_pool {
    name       = "default"
    vm_size    = var.aks_info.node_size
    node_count = var.aks_info.node_count
  }
  identity {
    type = "SystemAssigned"
  }
  depends_on = [azurerm_resource_group.base]

}




resource "null_resource" "config" {
  triggers = {
    build_id = var.build_id
  }
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${azurerm_resource_group.base.name} --name ${azurerm_kubernetes_cluster.base.name}"

  }
  depends_on = [azurerm_kubernetes_cluster.base]

}