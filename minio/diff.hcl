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

  sha     = "25b23ad16ea2255bdc0cd6cdfe735e7e4df476589a235865c7260879df854613"
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
