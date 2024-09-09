terraform {
  required_providers {
    jamfpro = {
      source  = "deploymenttheory/jamfpro"
      version = ">= 0.2.0"
    }

  }
}

## Jamf Pro provider root configuration
provider "jamfpro" {
  jamfpro_instance_fqdn                = var.jamfpro_instance_url
  auth_method                          = var.jamfpro_auth_method
  client_id                            = var.jamfpro_client_id
  client_secret                        = var.jamfpro_client_secret
  enable_client_sdk_logs               = false
  hide_sensitive_data                  = true # Hides sensititve data in logs
  token_refresh_buffer_period_seconds  = 5    # minutes
  jamfpro_load_balancer_lock           = true
  mandatory_request_delay_milliseconds = 100
}

## Create categories
resource "jamfpro_category" "category_test" {
  name     = "My Category"
  priority = 1
}
resource "jamfpro_smart_computer_group" "smart_example" {
  name = "Example Smart Computer Group"
  criteria {
    name        = "Profile Name"
    search_type = "has"
    value       = "something"
    and_or      = "and"
    priority    = 0
  }
}
