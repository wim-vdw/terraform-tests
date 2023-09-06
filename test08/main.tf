resource "elasticstack_elasticsearch_index" "persons" {
  name                = "persons"
  deletion_protection = false
  mappings = jsonencode({
    properties = {
      firstName = { type = "text" },
      lastName  = { type = "text" },
      gender    = { type = "keyword" }
    }
  })
}

data "elasticstack_elasticsearch_security_user" "user" {
  username = "elastic"
}

data "elasticstack_elasticsearch_security_role" "role" {
  name = "superuser"
}

output "user" {
  value = data.elasticstack_elasticsearch_security_user.user
}

output "role" {
  value = data.elasticstack_elasticsearch_security_role.role
}
