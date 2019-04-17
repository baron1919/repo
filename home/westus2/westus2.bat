set deploymentName="r459d0depwestus2"
set subscriptionId="d015e888-c99a-4bcc-baa4-825b8df5416c"
set resourceGroupName="rg195409"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus2\template.json"
set parametersFilePath="C:\scale\home\westus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%