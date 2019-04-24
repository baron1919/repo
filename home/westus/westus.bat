set deploymentName="r459d09westus"
set subscriptionId="3b44c68e-bba0-49eb-9a0f-ee7540989ede"
set resourceGroupName="rg268593"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus\template.json"
set parametersFilePath="C:\scale\home\westus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%