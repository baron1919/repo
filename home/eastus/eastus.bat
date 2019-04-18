set deploymentName="r459d0depeastus"
set subscriptionId="ee7c1e9d-01b9-4075-bf44-63806c711cfe"
set resourceGroupName="rg750365"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus\template.json"
set parametersFilePath="C:\scale\home\eastus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%