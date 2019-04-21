set deploymentName="r459d0depeastus2"
set subscriptionId="6f880614-2059-42a0-b55e-18bf87b6511c"
set resourceGroupName="rg056032"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus2\template.json"
set parametersFilePath="C:\scale\home\eastus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%