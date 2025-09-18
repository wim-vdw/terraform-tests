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


data "github_repositories" "repos" {
  query = "org:wim-vdw"
}

data "github_branch_protection_rules" "rules" {
  count      = length(data.github_repositories.repos.names)
  repository = data.github_repositories.repos.names[count.index]
}
