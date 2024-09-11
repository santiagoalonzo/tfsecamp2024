terraform {
  required_providers {
    jsc = {
      source  = "danjamf/jsctfprovider"
      version = ">= 0.0.15"
    }
  }
}

provider "jsc" {
  # Configure provider-specific settings if needed
  # Only local email accounts are supported. No SSO or SAML
  # CustomerID is optional
  username = "tfsecamp2024@cuddeford.com"
  password = "Tfisfun2024"
}

data "jsc_routes" "jscroute001" {
  name = "UK"
}

resource "jsc_ztna" "myztnaapp" {
  name      = "Dan123" //give it your name!
  routeid   = data.jsc_routes.jscroute001.id
  hostnames = ["example122.com", "example222.com"]
}
