set deploymentName="r459d0depeastus2"
set subscriptionId="7bb3f0c0-253c-4092-a546-c40c9bf63381"
set resourceGroupName="rg084248"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus2\template.json"
set parametersFilePath="C:\scale\home\eastus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%