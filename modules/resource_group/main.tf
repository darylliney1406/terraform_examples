resource "azurerm_resource_group" "lab_rg" {
  name     = var.rg_name
  location = var.rg_location
  tags = merge(local.tags, {
    resourceType = "ResourceGroup"
  })
}

output "resource_group_id" {
  value       = azurerm_resource_group.lab_rg.id
  description = "Outputting RG id to pass to other modules"
}

output "resource_group_name" {
  value       = azurerm_resource_group.lab_rg.name
  description = "Outputting RG name to pass to other modules"
}

output "resource_group_location" {
  value       = azurerm_resource_group.lab_rg.location
  description = "Outputting RG location to pass to other modules"
}
