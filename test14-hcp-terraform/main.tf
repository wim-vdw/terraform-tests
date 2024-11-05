data "tfe_organization" "wimvandenwyngaert" {
  name = "wimvandenwyngaert"
}

resource "tfe_project" "test" {
  organization = data.tfe_organization.wimvandenwyngaert.name
  name         = "test"
  description  = "This is a small test project"
}
