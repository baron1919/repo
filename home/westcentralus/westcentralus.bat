set deploymentName="rd0depw9estcentralus"
set subscriptionId="ee7c1e9d-01b9-4075-bf44-63806c711cfe"
set resourceGroupName="rg797364"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westcentralus\template.json"
set parametersFilePath="C:\scale\home\westcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%