data "tfe_organization" "wimvandenwyngaert" {
  name = "wimvandenwyngaert"
}

resource "tfe_organization" "wimvandenwyngaert" {
  name  = "wimvandenwyngaert"
  email = "wim.vandenwyngaert@gmail.com"
}

resource "tfe_project" "test" {
  organization = data.tfe_organization.wimvandenwyngaert.name
  name         = "test"
  description  = "This is a small test project"
}
