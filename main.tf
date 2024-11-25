# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

resource "azurerm_resource_group" "rg" {
  name     = "ctlk8rg"
  location = "Central India"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "k8cluster" {
  name                = "ctlk8cluster-aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "ctl-k8s"
  kubernetes_version  = "1.30.2"
  

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
    os_sku = "Ubuntu"
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
}
