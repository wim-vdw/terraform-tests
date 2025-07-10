# Terraform tests

Following address spaces are used for the different VNets that are created during the tests (to avoid overlap):

- 10.255.0.0/16
- 10.254.0.0/16
- 10.253.0.0/16
- 10.252.0.0/16

## test01

Following Terraform features have been tested to create Azure resource groups:

- Locals, variables, outputs
- Modules
- String interpolation/functions
- Lifecycles

**Important for upgrade to AzureRM Provider 4.x:**  
[The subscription_id property is required when performing a plan or apply operation, but is not required to run terraform validate](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#subscription_id)

## test02

Following Terraform features have been tested to create Azure network components:

- Virtual networks
- Virtual network peering
- Subnets
- Network security groups and rules

**Important for upgrade to AzureRM Provider 4.x:**  
[AzureRM Provider changes 3.103.0 (May 09, 2024)](https://github.com/hashicorp/terraform-provider-azurerm/blob/main/CHANGELOG-v3.md#31030-may-09-2024)  
[azurerm_subnet - the private_endpoint_network_policies_enabled property has been deprecated in favour of the private_endpoint_network_policies property #25779](https://github.com/hashicorp/terraform-provider-azurerm/pull/25779)

## test03

Test with Docker resources.

## test04

Following Terraform features have been tested to create Azure dashboard components:

- Shared dashboards
- Heredoc strings
- templatefile function with variables
- user-friendly dashboard titles
- Lifecycle to ignore changes to dashboard properties

## test05-hcp-terraform

Following Terraform features have been tested:

- Terraform Cloud workspace
- Terraform Cloud module to create dashboard

## test06

Following Azure features have been tested:

- Role Assignment
- Keyvault / Secrets
- Random Password generation

## test07

Following Azure features have been tested:

- Virtual machine (Linux)
- Public IP address
- VNet/Subnet/NSG
- Data disk

## test08

Test with Elasticstack resources.

## test09

Test with Terraform test framework.  
Only available in Terraform version >= 1.6.0

## test10

Following Azure features have been tested:

- Maintenance Configuration (Azure Update Manager)

## test11

Following Kubernetes features have been tested:

- Deployment
- ConfigMap

## test12

Test with Spacelift

## test13

Following Terraform features have been tested to create Azure Web App:

- App Service Plan
- Linux Web App (Python)

## test14-hcp-terraform

Following Terraform features have been tested:

- Maintain Terraform Cloud project and workspace
