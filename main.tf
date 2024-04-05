# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# management group.

data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "4.0.0"

  default_location = var.default_location

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id = data.azurerm_client_config.core.tenant_id
  root_id        = var.root_id
  root_name      = var.root_name

  # The following configuration is used to deploy the management group structure
  ###### Deploys MG structure with naming convention provided by customer and disables deployment of default core structure ######

  deploy_core_landing_zones = false

  custom_landing_zones = {
      "${var.root_id}" = {
        display_name               = "${lower(var.root_name)}"
        parent_management_group_id = "${data.azurerm_client_config.core.tenant_id}"
        subscription_ids           = ["25229114-2ec3-4b44-bb5b-649a554894bc"]
        archetype_config = {
          archetype_id   = "default_empty"
          parameters     = {}
          access_control = {}
        }
      }
   }
}
