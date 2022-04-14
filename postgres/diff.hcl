metadata {
  path = "postgres"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ceb2o2kA4JQkdu1cL19TawKeUDUPnC5MtBb+VL/6XfQ="
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

  sha     = "h1:ceb2o2kA4JQkdu1cL19TawKeUDUPnC5MtBb+VL/6XfQ="
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

  sha     = "b3e81587e23382ffe56e8a31b703bc8ead6b84271758527914fb242fd6edadb2"
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
