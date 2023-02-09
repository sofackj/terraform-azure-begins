# terraform-azure-begins

## Commands to follow with azure CLI
```sh
az login
```
```sh
az account list
```
```sh
az account set --subscription="SUBSCRIPTION_ID"
```
```sh
az account set --subscription="SUBSCRIPTION_ID"
```
```sh
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"
```
### appId client_id, password client_secret, tenant tenant_id
```sh
az login --service-principal -u CLIENT_ID -p CLIENT_SECRET --tenant TENANT_ID
```