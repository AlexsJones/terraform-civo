# terraform-civo

This repository is an example of how to deploy a K3S cluster on [Civo](https://www.civo.com)
It demonstrates how to use the provider and resources.

## Installation

Either pass variables directly, through tfvars or set as global envs.

```
TF_VAR_civotoken="TOKEN_NAME" \
TF_VAR_cluster_name="civo-terraform" \
TF_VAR_cluster_nodes=3 terraform plan
```

Expected output...

```

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # civo_kubernetes_cluster.cluster will be created
  + resource "civo_kubernetes_cluster" "cluster" {
      + api_endpoint           = (known after apply)
      + built_at               = (known after apply)
      + created_at             = (known after apply)
      + dns_entry              = (known after apply)
      + id                     = (known after apply)
      + installed_applications = (known after apply)
      + instances              = (known after apply)
      + kubeconfig             = (known after apply)
      + kubernetes_version     = (known after apply)
      + master_ip              = (known after apply)
      + name                   = "tycho"
      + num_target_nodes       = 3
      + ready                  = (known after apply)
      + status                 = (known after apply)
      + target_nodes_size      = "g2.large"
    }

Plan: 1 to add, 0 to change, 0 to destroy.
```

Then apply at will...

```
civo_kubernetes_cluster.cluster: Creating...
civo_kubernetes_cluster.cluster: Still creating... [10s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [20s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [30s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [40s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [50s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [1m0s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [1m10s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [1m20s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [1m30s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [1m40s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [1m50s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [2m0s elapsed]
civo_kubernetes_cluster.cluster: Still creating... [2m10s elapsed]
civo_kubernetes_cluster.cluster: Creation complete after 2m19s [id=ff7a428b-dc51-41d7-bd8a-cc8917a44d13]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```
