data "aws_iam_users" "users" {}

data "aws_iam_roles" "roles" {}

output "users" {
  value = data.aws_iam_users.users.names
}

output "roles" {
  value = data.aws_iam_roles.roles.names
}
