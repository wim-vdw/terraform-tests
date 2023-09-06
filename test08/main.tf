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
