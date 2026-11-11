terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~> 16.0"
    }
  }
backend "http" {
    address        = "https://gitlab.com/api/v4/projects/83279850/terraform/state/main"
    lock_address   = "https://gitlab.com/api/v4/projects/83279850/terraform/state/main/lock"
    unlock_address = "https://gitlab.com/api/v4/projects/83279850/terraform/state/main/lock"
    lock_method    = "POST"
    unlock_method  = "DELETE"
    retry_wait_min = 5
  }
}

provider "gitlab" {
  token = "glpat-9nRIaanTFNCXWP-FIEcDZmM6MQpvOjEKdTpuNnl6aQ8.01.170iulsua"
}

# Créer un nouveau repo
resource "gitlab_project" "network_docs" {
  name        = "network-documentation"
  description = "Documentation de l'architecture réseau EVE-NG"
  visibility_level = "private"
}
      
# Ajouter une variable CI/CD
resource "gitlab_project_variable" "ansible_user" {
  project   = gitlab_project.network_docs.id
  key       = "ANSIBLE_USER"
  value     = "admin"
  protected = true
}
# Importer et gérer ton projet ansible existant
resource "gitlab_project_variable" "ansible_inventory" {
  project   = "arijenahdi21-group/ansible-network-lab"
  key       = "INVENTORY_PATH"
  value     = "$CI_PROJECT_DIR/inventory.ini"
  protected = false
}

resource "gitlab_project_variable" "ansible_config" {
  project   = "arijenahdi21-group/ansible-network-lab"
  key       = "ANSIBLE_CONFIG"
  value     = "$CI_PROJECT_DIR/ansible.cfg"
  protected = false
}
# Variable CI/CD pour le pipeline Terraform
resource "gitlab_project_variable" "gitlab_token" {
  project   = gitlab_project.network_docs.id
  key       = "GITLAB_TOKEN"
  value     = var.gitlab_token
  protected = true
  masked    = true
}

# Protéger la branche main de ansible-network-lab
resource "gitlab_branch_protection" "ansible_main" {
  project            = "arijenahdi21-group/ansible-network-lab"

  branch             = "main"
  push_access_level  = "maintainer"
  merge_access_level = "developer"
}
