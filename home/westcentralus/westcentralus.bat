set deploymentName="rd0depw9estcentralus"
set subscriptionId="d015e888-c99a-4bcc-baa4-825b8df5416c"
set resourceGroupName="rg195409"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westcentralus\template.json"
set parametersFilePath="C:\scale\home\westcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%