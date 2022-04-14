metadata {
  path = "minio"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:YJuVZmlEmXx92M/SmAGZSCLdo1M3aoSsaSsbyUs83bo="
  retries = 0
}

step "terraform" {
  wkdir   = "minio/terraform"
  target  = "minio/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "minio",
  ]

  sha     = "h1:YJuVZmlEmXx92M/SmAGZSCLdo1M3aoSsaSsbyUs83bo="
  retries = 0
}

step "kube-init" {
  wkdir   = "minio"
  target  = "minio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "minio",
  ]

  sha     = "d65e95e09b373e12ca989966fb1982e6e16afec1b497366a9775df563542956e"
  retries = 0
}

step "helm" {
  wkdir   = "minio/helm"
  target  = "minio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "minio",
  ]

  sha     = "h1:InL6qZ7Y4c9cSEG9UfRMAhrnSMdwUsmLTxxKTJHHYZs="
  retries = 0
}
