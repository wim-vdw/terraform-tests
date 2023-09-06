variable "username" {}
variable "password" {}

terraform {
  required_providers {
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "< 1.0.0"
    }
  }
}

provider "elasticstack" {
  elasticsearch {
    username  = var.username
    password  = var.password
    endpoints = ["https://localhost:9200"]
    insecure  = true
  }
}
