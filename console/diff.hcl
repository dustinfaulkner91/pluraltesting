metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:s0pgReESgN8/IbS3K0NsKlo1y9EjdmonUDDmjVLLhmU="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:s0pgReESgN8/IbS3K0NsKlo1y9EjdmonUDDmjVLLhmU="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "c055b8cc7e1d2913bcae967f3735f46d0ebc1efe702630a98324b4213449ad7b"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:bl0fTI/vEmpzpRbqUe5sHa5DW5pGKTf9x7kEUh8hk3w="
  retries = 0
}
