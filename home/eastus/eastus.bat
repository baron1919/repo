set deploymentName="r459d0depeastus"
set subscriptionId="a8ffe769-7272-47d8-a95c-4062bf7e7b1c"
set resourceGroupName="rg680645"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus\template.json"
set parametersFilePath="C:\scale\home\eastus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%