terraform {
  required_providers {
    jsc = {
      source  = "danjamf/jsctfprovider"
      version = ">= 0.0.15"
    }
  }
}


resource "jsc_blockpage" "data_block" {
  title               = "Content Blocked"
  description         = "This site is blocked by an administrator-defined Internet content policy. You are able to customize this policy – and even this message – in your organization's Jamf Security Cloud console."
  type                = "block"
  show_requesturl     = true
  show_classification = true
}


resource "jsc_oktaidp" "okta_idp_base" {
  clientid  = var.tje_okta_clientid
  name      = "Okta IDP Integration"
  orgdomain = var.tje_okta_orgdomain
}

resource "jsc_ap" "all_services" {
  name             = "Jamf Connect ZTNA and Protect"
  oktaconnectionid = jsc_oktaidp.okta_idp_base.id
  privateaccess    = true
  threatdefence    = true
  datapolicy       = true
  idptype          = "OKTA"
}
