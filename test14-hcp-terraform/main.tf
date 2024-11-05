data "tfe_organization" "wimvandenwyngaert" {
  name = "wimvandenwyngaert"
}

resource "tfe_project" "test" {
  organization = data.tfe_organization.wimvandenwyngaert.name
  name         = "test"
  description  = "This is a small test project"
}

resource "tfe_workspace" "terraform-tests-test05" {
  name              = "terraform-tests-test05"
  organization      = data.tfe_organization.wimvandenwyngaert.name
  project_id        = tfe_project.test.id
  queue_all_runs    = false
  force_delete      = false
  working_directory = "test05-hcp-terraform"

  vcs_repo {
    identifier                 = "wim-vdw/terraform-tests"
    github_app_installation_id = "ghain-2qdT7CovWHxFKtmE"
  }
}

resource "tfe_workspace_settings" "terraform-tests-test05-settings" {
  workspace_id   = tfe_workspace.terraform-tests-test05.id
  execution_mode = "remote"
}
