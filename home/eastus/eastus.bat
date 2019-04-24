set deploymentName="r459d0depeastus"
set subscriptionId="0272aadd-8007-49eb-84ad-feb406294dae"
set resourceGroupName="rg818065"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus\template.json"
set parametersFilePath="C:\scale\home\eastus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%