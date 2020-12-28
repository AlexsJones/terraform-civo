variable "civotoken" {}

provider "civo" {
  token = var.civotoken
}

terraform {
  required_version = ">= 0.13.0"
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}
