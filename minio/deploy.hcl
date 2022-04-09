metadata {
  path = "minio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "minio\terraform"
  target  = "minio\terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = ""
  retries = 0
}

step "terraform-apply" {
  wkdir   = "minio\terraform"
  target  = "minio\terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = ""
  retries = 1
}

step "terraform-output" {
  wkdir   = "minio"
  target  = "minio\terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "minio",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "minio"
  target  = "minio\.plural\NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = ""
  retries = 0
}

step "crds" {
  wkdir   = "minio"
  target  = "minio\crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "minio",
  ]

  sha     = ""
  retries = 0
}

step "bounce" {
  wkdir   = "minio"
  target  = "minio\helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "minio",
  ]

  sha     = ""
  retries = 1
}
