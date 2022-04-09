metadata {
  path = "etcd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "etcd\terraform"
  target  = "etcd\terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
}

step "terraform-apply" {
  wkdir   = "etcd\terraform"
  target  = "etcd\terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = ""
  retries = 1
}

step "terraform-output" {
  wkdir   = "etcd"
  target  = "etcd\terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "etcd",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd\.plural\NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = ""
  retries = 0
}

step "crds" {
  wkdir   = "etcd"
  target  = "etcd\crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "etcd",
  ]

  sha     = ""
  retries = 0
}

step "bounce" {
  wkdir   = "etcd"
  target  = "etcd\helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "etcd",
  ]

  sha     = ""
  retries = 1
}
