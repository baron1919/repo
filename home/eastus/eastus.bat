set deploymentName="r459d0depeastus"
set subscriptionId="452ca00b-bc62-4a69-b395-414e445a3277"
set resourceGroupName="rg780857"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus\template.json"
set parametersFilePath="C:\scale\home\eastus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%