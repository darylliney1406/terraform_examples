## Create accounts
# Break Glass Account
resource "azuread_user" "break-glass-account-1" {
  user_principal_name = var.upn-bg1
  display_name        = var.account-display-name-bg1
  password            = var.account-password-bg1
  given_name          = "Break"
  surname             = "Glass"
  company_name        = "Subwave Professional"
  street_address      = "35 Bonington Chase, Chelmsford, Essex"
}

## Create security group and enroll user accounts
resource "azuread_group" "break-glass-sec-group" {
  display_name       = var.security-group-display-name
  security_enabled   = true
  assignable_to_role = true

  members = [
    azuread_user.break-glass-account-1.id,
  ]
}

## Assign AAD GA role
resource "azuread_directory_role" "break-glass-role" {
  display_name = "Global Administrator"
}

resource "azuread_directory_role_assignment" "break-glass-ad-role" {
  role_id             = azuread_directory_role.break-glass-role.object_id
  principal_object_id = azuread_group.break-glass-sec-group.object_id
}

## Assign subscription owner role
resource "azurerm_role_assignment" "break-glass-sub-owners" {
  for_each = {
    "subscription" = "/subscriptions/63e7a5ea-f29f-4c25-91ba-2a07d76eba71"
    "subscription" = "/subscriptions/c9e30b24-8260-4531-811a-16379b9e1fe4"
    "subscription" = "/subscriptions/14b26940-6312-4a49-b422-dd7a45c033ba"
  }

  scope                = each.value
  role_definition_name = "Owner"
  principal_id         = azuread_group.break-glass-sec-group.id
}


## Set conditional access policy
resource "azuread_conditional_access_policy" "MFAPolicy" {
  display_name = "Break Glass 2FA Enable"
  state        = "enabled"

  conditions {
    client_app_types = ["browser", "mobileAppsAndDesktopClients"]

    applications {
      included_applications = ["All"]
      excluded_applications = []
    }
    locations {
      included_locations = ["All"]
      excluded_locations = ["AllTrusted"]
    }
    users {
      included_users  = []
      excluded_users  = []
      included_groups = ["${azuread_group.break-glass-sec-group.id}"]
    }

  }

  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa", "domainJoinedDevice"]
  }
}
