set deploymentName="r459d09westus"
set subscriptionId="6f880614-2059-42a0-b55e-18bf87b6511c"
set resourceGroupName="rg242428"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus\template.json"
set parametersFilePath="C:\scale\home\westus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%