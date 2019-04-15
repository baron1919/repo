set deploymentName="r459d09westus"
set subscriptionId="af6faac2-df78-4e22-8fef-67a511616653"
set resourceGroupName="rg910245"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus\template.json"
set parametersFilePath="C:\scale\home\westus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%