metadata {
  path = "etcd"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:eyIfaHlnZAa21xs+LsoWeTDtlb9e6m1ZAaQgmzbfRcA="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "etcd/terraform"
  target  = "etcd/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:eyIfaHlnZAa21xs+LsoWeTDtlb9e6m1ZAaQgmzbfRcA="
  retries = 1
}

step "terraform-output" {
  wkdir   = "etcd"
  target  = "etcd/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "45fecbcf7cdeaf83b8fdbf7b84523034180e8d8e5759c3124505d73d3d804e8a"
  retries = 0
}

step "crds" {
  wkdir   = "etcd"
  target  = "etcd/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "etcd",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "etcd"
  target  = "etcd/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "etcd",
  ]

  sha     = "h1:yTnWNTkrIdlFDNwO+YfhCOj0dAL26nPQz/tk8lVzTpQ="
  retries = 1
}
