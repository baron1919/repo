set deploymentName="r459d0depeastus"
set subscriptionId="3b44c68e-bba0-49eb-9a0f-ee7540989ede"
set resourceGroupName="rg268593"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus\template.json"
set parametersFilePath="C:\scale\home\eastus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%