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

  sha     = "3b525ea4efa64de866ba59fe53d9c89e32513731e5e4d1c84747769ee86e9556"
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
