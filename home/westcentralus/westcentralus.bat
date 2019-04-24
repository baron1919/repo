set deploymentName="rd0depw9estcentralus"
set subscriptionId="7bb3f0c0-253c-4092-a546-c40c9bf63381"
set resourceGroupName="rg084248"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westcentralus\template.json"
set parametersFilePath="C:\scale\home\westcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%