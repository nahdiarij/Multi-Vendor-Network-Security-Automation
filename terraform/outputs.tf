output "network_docs_url" {
  description = "URL du repo network-documentation"
  value       = gitlab_project.network_docs.web_url
}

output "network_docs_id" {
  description = "ID du repo network-documentation"
  value       = gitlab_project.network_docs.id
}

