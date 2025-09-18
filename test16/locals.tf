locals {
  repos = {
    argocd-setup = {
      name          = "argocd-setup"
      description   = "Argo CD installation and configuration"
      visibility    = "public"
      has_downloads = true
      has_issues    = true
      has_projects  = true
      has_wiki      = true
    },
    argocd-apps = {
      name          = "argocd-apps"
      description   = "Argo CD application definitions"
      visibility    = "public"
      has_downloads = true
      has_issues    = true
      has_projects  = true
      has_wiki      = true
    },
    argocd-k8s-resources = {
      name          = "argocd-k8s-resources"
      description   = "Kubernetes manifests or Helm charts used by Argo CD applications"
      visibility    = "public"
      has_downloads = true
      has_issues    = true
      has_projects  = true
      has_wiki      = true
    },
    test = {
      name          = "test"
      description   = "Test repository for Terraform GitHub provider"
      visibility    = "private"
      has_downloads = true
      has_issues    = true
      has_projects  = true
      has_wiki      = true
    }
  }
}
