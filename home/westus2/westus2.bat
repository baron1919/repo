set deploymentName="r459d0depwestus2"
set subscriptionId="dd448447-6546-4b97-b3f9-95ca9b8454b2"
set resourceGroupName="rg474424"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus2\template.json"
set parametersFilePath="C:\scale\home\westus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%