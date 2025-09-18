module "repository" {
  source        = "./repository"
  for_each      = local.repos
  name          = each.value.name
  description   = each.value.description
  has_downloads = each.value.has_downloads
  has_issues    = each.value.has_issues
  has_projects  = each.value.has_projects
  has_wiki      = each.value.has_wiki
}


data "github_repositories" "repositories" {
  query = "org:wim-vdw"
}

data "github_branch_protection_rules" "branch_protection_rules" {
  for_each   = toset(data.github_repositories.repositories.names)
  repository = each.key
}
