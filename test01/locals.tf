locals {
  resource_groups_map = {
    backend = {
      application = "backend"
      location    = "North Europe"
      environment = "production"
      tags = {
        application = "Backend application"
        database    = "SAP HANA 2.0"
        OS          = "Linux RHEL"
        environment = "Production"
      }
    }
    frontend = {
      application = "frontend"
      location    = "North Europe"
      environment = "production"
      sequence    = 10
    }
    database = {
      application = "database"
      location    = "North Europe"
      environment = "production"
      tags = {
        database    = "PostgreSQL 15"
        OS          = "Ubuntu 24.04"
        environment = "Production"
      }
    }
  }
  resource_groups_list = [
    {
      application = "backend"
      location    = "Belgium Central"
      environment = "development"
      sequence    = null
    },
    {
      application = "frontend"
      location    = "Belgium Central"
      environment = "development"
      sequence    = 25
    }
  ]
}
