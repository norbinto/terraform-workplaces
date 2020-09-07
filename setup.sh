RESOURCE_GROUP_NAME=rg-norbi-terraform
STORAGE_ACCOUNT_NAME=norbisaterraform
CONTAINER_NAME=norbitfstate

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Get storage account key
ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query "[0].value" -o tsv)

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
az ad sp create-for-rbac --name "xcc-norbi-tf-service" --role contributor --scopes /subscriptions/$SUBSCRIPTION_ID --sdk-auth