set deploymentName="r459d0depwestus2"
set subscriptionId="fd19faab-b635-424b-84ae-384249a593ee"
set resourceGroupName="rg461614"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westeurope\template.json"
set parametersFilePath="C:\scale\home\westeurope\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%