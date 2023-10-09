### Authenticate using the default Azure credentials

[DefaultAzureCredential Class](https://learn.microsoft.com/en-us/dotnet/api/azure.identity.defaultazurecredential?view=azure-dotnet)

```Python
from azure.identity import DefaultAzureCredential
from azure.storage.blob import BlobServiceClient

# Acquire a credential object
credential = DefaultAzureCredential()

blob_service_client = BlobServiceClient(
    account_url="https://gdc159.blob.core.windows.net",
    credential=credential)

print('Create container with name test.')
blob_service_client.create_container('test')
print('Delete container with name test.')
blob_service_client.delete_container('test')
```

### Authenticate using a managed (system) identity

[ManagedIdentityCredential Class](https://learn.microsoft.com/en-us/dotnet/api/azure.identity.managedidentitycredential?view=azure-dotnet)

```Python
from azure.identity import ManagedIdentityCredential
from azure.storage.blob import BlobServiceClient

# Acquire a credential object
credential = ManagedIdentityCredential()

blob_service_client = BlobServiceClient(
    account_url="https://gdc159.blob.core.windows.net",
    credential=credential)

print('Create container with name test.')
blob_service_client.create_container('test')
print('Delete container with name test.')
blob_service_client.delete_container('test')
```
