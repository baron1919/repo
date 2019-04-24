set deploymentName="rd0depsouthcentralus"
set subscriptionId="6f880614-2059-42a0-b55e-18bf87b6511c"
set resourceGroupName="rg242428"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\southcentralus\template.json"
set parametersFilePath="C:\scale\home\southcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%