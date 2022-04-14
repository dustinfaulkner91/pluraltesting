metadata {
  path = "etcd"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:eyIfaHlnZAa21xs+LsoWeTDtlb9e6m1ZAaQgmzbfRcA="
  retries = 0
}

step "terraform" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "etcd",
  ]

  sha     = "h1:eyIfaHlnZAa21xs+LsoWeTDtlb9e6m1ZAaQgmzbfRcA="
  retries = 0
}

step "kube-init" {
  wkdir   = "etcd"
  target  = "etcd/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "etcd",
  ]

  sha     = "45fecbcf7cdeaf83b8fdbf7b84523034180e8d8e5759c3124505d73d3d804e8a"
  retries = 0
}

step "helm" {
  wkdir   = "etcd/helm"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "etcd",
  ]

  sha     = "h1:yTnWNTkrIdlFDNwO+YfhCOj0dAL26nPQz/tk8lVzTpQ="
  retries = 0
}
