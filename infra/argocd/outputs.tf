output "argocd_namespace" {
  description = "Namespace where ArgoCD is installed"
  value       = helm_release.argocd.namespace
}

output "argocd_server_service" {
  description = "Name of the ArgoCD server service"
  value       = "${helm_release.argocd.name}-server"
}
