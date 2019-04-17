set deploymentName="r459d0depwestus2"
set subscriptionId="452ca00b-bc62-4a69-b395-414e445a3277"
set resourceGroupName="rg780857"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus2\template.json"
set parametersFilePath="C:\scale\home\westus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%