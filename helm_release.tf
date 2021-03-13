resource "helm_release" "gitlab" {
  name             = "gitlab"
  chart            = "gitlab"
  repository       = "https://charts.gitlab.io/"
  namespace        = "gitlab"
  version          = "4.7.4"
  create_namespace = true
  wait             = false
  set {
    name  = "global.hosts.domain"
    value = var.dns_name
  }
  set {
    name  = "global.edition"
    value = "ce"
  }
  set {
    name  = "certmanager-issuer.email"
    value = "alexsimonjones@gmail.com"
  }
  set {
    name  = "gitlab-runner.runners.privileged"
    value = true
  }
  set {
    name  = "global.ingress.tls.enabled"
    value = "true"
  }
}

data "kubernetes_service" "gitlab_ingress" {
  metadata {
    namespace = "gitlab"
    name      = "gitlab-nginx-ingress-controller"
  }
  depends_on = [helm_release.gitlab]
}
