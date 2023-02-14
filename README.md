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
### Pick up the private key and the public ip of the instance
```sh
terraform output -raw tls_private_key > id_rsa
terraform output public_ip_address
```