# Get the current client configuration from the AzureRM provider.
# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# management group.

data "azurerm_client_config" "core" {}

# Declare the Azure landing zones Terraform module
# and provide a base configuration.

module "enterprise_scale" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "5.0.0"

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

  deploy_core_landing_zones = true

  # custom_landing_zones = {
  #     "${var.root_id}" = {
  #       display_name               = "${lower(var.root_name)}"
  #       parent_management_group_id = "${data.azurerm_client_config.core.tenant_id}"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #      "${var.root_id}-platform" = {
  #       display_name               = "Platform"
  #       parent_management_group_id = "${var.root_id}"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-landingzones" = {
  #       display_name               = "Landing Zones"
  #       parent_management_group_id = "${var.root_id}"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-decom" = {
  #       display_name               = "Decommissioned"
  #       parent_management_group_id = "${var.root_id}"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #       # depends_on= [azurerm_subscription.connectivity1,azurerm_subscription.connectivity2]
  #     }
  #     "${var.root_id}-sandbox" = {
  #       display_name               = "Sandbox"
  #       parent_management_group_id = "${var.root_id}"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-iam" = {
  #       display_name               = "Identity and Access Managment"
  #       parent_management_group_id = "${var.root_id}-platform"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     ##### landing zone #####
  #     "${var.root_id}-management" = {
  #       display_name               = "Management"
  #       parent_management_group_id = "${var.root_id}-platform"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-connectivity" = {
  #       display_name               = "Connectivity"
  #       parent_management_group_id = "${var.root_id}-platform"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-uat" = {
  #       display_name               = "UAT"
  #       parent_management_group_id = "${var.root_id}-landingzones"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-dev" = {
  #       display_name               = "Dev"
  #       parent_management_group_id = "${var.root_id}-landingzones"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  #     "${var.root_id}-prod" = {
  #       display_name               = "Prod"
  #       parent_management_group_id = "${var.root_id}-landingzones"
  #       subscription_ids           = []
  #       archetype_config = {
  #         archetype_id   = "default_empty"
  #         parameters     = {}
  #         access_control = {}
  #       }
  #     }
  # }
}
