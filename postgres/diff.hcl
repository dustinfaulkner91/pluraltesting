metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:9h6lD80vMPplbgv3IHq1qSb5hYwSHkpZsHBzvlO9zus="
  retries = 0
}

step "terraform" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "postgres",
  ]

  sha     = "h1:9h6lD80vMPplbgv3IHq1qSb5hYwSHkpZsHBzvlO9zus="
  retries = 0
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "postgres",
  ]

  sha     = "26dd6bc3b1f712342a2538897efd1565be9fb692618b28ce4732dcaf50b30e19"
  retries = 0
}

step "helm" {
  wkdir   = "postgres/helm"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "postgres",
  ]

  sha     = "h1:pdiPbuSEHU0iy7HUwZae/xKSqAhCREiUAlqas/LBZuQ="
  retries = 0
}
