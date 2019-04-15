set deploymentName="rd0depsouthcentralus"
set subscriptionId="f23f96dc-087f-4ed0-9d1f-021ddf39d48f"
set resourceGroupName="rg133623"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\southcentralus\template.json"
set parametersFilePath="C:\scale\home\southcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%