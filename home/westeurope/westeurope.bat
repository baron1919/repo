set deploymentName="r459d0depwestus2"
set subscriptionId="af6faac2-df78-4e22-8fef-67a511616653"
set resourceGroupName="rg910245"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westeurope\template.json"
set parametersFilePath="C:\scale\home\westeurope\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%