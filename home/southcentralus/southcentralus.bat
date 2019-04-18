set deploymentName="rd0depsouthcentralus"
set subscriptionId="ee7c1e9d-01b9-4075-bf44-63806c711cfe"
set resourceGroupName="rg750365"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\southcentralus\template.json"
set parametersFilePath="C:\scale\home\southcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%