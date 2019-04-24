set deploymentName="r459d0depwestus2"
set subscriptionId="3b44c68e-bba0-49eb-9a0f-ee7540989ede"
set resourceGroupName="rg268593"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westus2\template.json"
set parametersFilePath="C:\scale\home\westus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%