# Terraform tests
Following address spaces are used for the different VNets that are created during the tests (to avoid overlap):
- 10.255.0.0/16
- 10.254.0.0/16
## test01
Following Terraform features have been tested to create Azure resource groups:
- Locals, variables, outputs
- Modules
- String interpolation/functions
- Lifecycles
## test02
Following Terraform features have been tested to create Azure network components:
- Virtual networks
- Virtual network peering
- Subnets
- Network security groups and rules
## test03
Test with Docker resources.
## test04
Following Terraform features have been tested to create Azure dashboard components:
- Azure shared dashboards
- Heredoc strings
- Lifecycles
