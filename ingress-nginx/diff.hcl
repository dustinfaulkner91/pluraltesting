metadata {
  path = "ingress-nginx"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:k1nTcTPz3O33SnJR/hrsRR+JwJgQ/D2Qsb3BFrMJArQ="
  retries = 0
}

step "terraform" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "ingress-nginx",
  ]

  sha     = "h1:k1nTcTPz3O33SnJR/hrsRR+JwJgQ/D2Qsb3BFrMJArQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "ingress-nginx",
  ]

  sha     = "5b527126172ec08d952bb2a59fac2282711dc97461f96efd13325280d7c52147"
  retries = 0
}

step "helm" {
  wkdir   = "ingress-nginx/helm"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "ingress-nginx",
  ]

  sha     = "h1:z8vnEdqabQ2v71uH+msS9QiMzlKA8LTM3DQJWWa4aXc="
  retries = 0
}
