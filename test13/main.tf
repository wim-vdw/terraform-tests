data "terraform_remote_state" "test" {
  backend = "remote"

  config = {
    hostname     = "spacelift.io"
    organization = "wim-vdw"

    workspaces = {
      name = "test"
    }
  }
}

output "test" {
  value = data.terraform_remote_state.test
}
