set deploymentName="rd0depsouthcentralus"
set subscriptionId="0272aadd-8007-49eb-84ad-feb406294dae"
set resourceGroupName="rg818065"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\southcentralus\template.json"
set parametersFilePath="C:\scale\home\southcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%