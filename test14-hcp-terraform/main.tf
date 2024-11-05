data "tfe_organization" "wimvandenwyngaert" {
  name = "wimvandenwyngaert"
}

output "test" {
  value = data.tfe_organization.wimvandenwyngaert
}
