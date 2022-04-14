metadata {
  path = "monitoring"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:YMmUJxLmUQTlNC7qek1LZFo4K+hIroiITT+d18lsLLs="
  retries = 0
}

step "terraform" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "monitoring",
  ]

  sha     = "h1:YMmUJxLmUQTlNC7qek1LZFo4K+hIroiITT+d18lsLLs="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "monitoring",
  ]

  sha     = "433e9f7892bf6369ebb370b0cff668dc2bd578865f232420feb545dcac4319d1"
  retries = 0
}

step "helm" {
  wkdir   = "monitoring/helm"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "monitoring",
  ]

  sha     = "h1:qbLHiq1e9+ox4GCW0DCTRRLEMrINozJ20xF4C34bc8U="
  retries = 0
}
