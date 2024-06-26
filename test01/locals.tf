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
    }
  }
  resource_groups_list = [
    {
      application = "backend"
      location    = "West Europe"
      environment = "development"
      sequence    = null
    },
    {
      application = "frontend"
      location    = "West Europe"
      environment = "development"
      sequence    = 25
    }
  ]
}
