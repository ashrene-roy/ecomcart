#!/bin/bash

set +e
url='https://management.azure.com/subscriptions/'$ARM_SUBSCRIPTION_ID'/resourceGroups/'$TF_VAR_resource_group_name'/providers/Microsoft.ApiManagement/service/'$TF_VAR_api_management_name'/apis/LegacyInventoryServiceAPI/operations?api-version=2022-08-01'
response=$(az rest --uri $url --query "(value[?properties.displayName == 'GetProductMetadataById']).name" 2>&1)
echo $response
set -e