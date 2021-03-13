data "civo_dns_domain_name" "domain" {
  name = var.dns_name
}

output "domain_output" {
  value = data.civo_dns_domain_name.domain.name
}
output "domain_id_output" {
  value = data.civo_dns_domain_name.domain.id
}

resource "civo_dns_domain_record" "gitlab-www" {
  domain_id = data.civo_dns_domain_name.domain.id
  type      = "A"
  name      = join(".", ["gitlab", var.dns_name])
  value     = data.kubernetes_service.gitlab_ingress.status.0.load_balancer.0.ingress.0.hostname
  ttl       = 600

  depends_on = [helm_release.gitlab]
}

resource "civo_dns_domain_record" "registry-www" {
  domain_id = data.civo_dns_domain_name.domain.id
  type      = "A"
  name      = join(".", ["registry", var.dns_name])
  value     = data.kubernetes_service.gitlab_ingress.status.0.load_balancer.0.ingress.0.hostname
  ttl       = 600

  depends_on = [helm_release.gitlab]
}

resource "civo_dns_domain_record" "minio-www" {
  domain_id = data.civo_dns_domain_name.domain.id
  type      = "A"
  name      = join(".", ["minio", var.dns_name])
  value     = data.kubernetes_service.gitlab_ingress.status.0.load_balancer.0.ingress.0.hostname
  ttl       = 600

  depends_on = [helm_release.gitlab]
}
