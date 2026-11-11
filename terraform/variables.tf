variable "gitlab_token" {
  description = "Token d'accès GitLab"
  type        = string
  sensitive   = true
}

variable "gitlab_group" {
  description = "Nom du groupe GitLab"
  type        = string
  default     = "arijenahdi21-group"
}

variable "gitlab_username" {
  description = "Username GitLab"
  type        = string
  default     = "arijenahdi21"
}

