variable "cluster_name" {
  default = "tycho"
}

variable "cluster_nodes" {
  default = "3"
}

variable "dns_name" {
  default = "cloudskunkworks.co.uk"
}

variable "civotoken" {}

variable "kubeconfig_filename" {
  default = "~/.kube/config"
}
