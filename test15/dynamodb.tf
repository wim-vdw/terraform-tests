resource "aws_dynamodb_table" "names" {
  name           = "names"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table" "cities" {
  name           = "cities"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "country"
  range_key      = "city"

  attribute {
    name = "country"
    type = "S"
  }

  attribute {
    name = "city"
    type = "S"
  }
}
