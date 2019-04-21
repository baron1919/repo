set deploymentName="r459d0depwestus2"
set subscriptionId="6f880614-2059-42a0-b55e-18bf87b6511c"
set resourceGroupName="rg056032"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus2\template.json"
set parametersFilePath="C:\scale\home\westus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%