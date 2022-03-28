# Deploy an Azure hosted Serverless React Webapp with Azure Functions API with Terraform

## Prerequisites

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- [terraform](https://www.terraform.io/downloads)
- [make](https://www.gnu.org/software/make/)
- [func](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Cmacos%2Ccsharp%2Cportal%2Cbash#install-the-azure-functions-core-tools)
- [node](https://nodejs.org/en/download/)

## Authenticate the Azure CLI

If you are using a personal account, run `az login` & `az account show` to check you are logged in.

If you are using an Azure Service Principal for authentication, run

```
export ARM_CLIENT_ID=REPLACE_ME
export ARM_CLIENT_SECRET=REPLACE_ME
export ARM_SUBSCRIPTION_ID=REPLACE_ME
export ARM_TENANT_ID=REPLACE_ME
export ARM_USE_CLI=false
```

## Steps

```sh
make first-deploy
# Browse to the URL printed in the console
make destroy
```
