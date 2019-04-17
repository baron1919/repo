set deploymentName="rd0depw9estcentralus"
set subscriptionId="452ca00b-bc62-4a69-b395-414e445a3277"
set resourceGroupName="rg780857"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westcentralus\template.json"
set parametersFilePath="C:\scale\home\westcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%