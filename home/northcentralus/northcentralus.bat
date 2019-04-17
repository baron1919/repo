set deploymentName="rd0depnorthcentralus"
set subscriptionId="dc7576ab-f6ed-4928-82ed-90d2ee8f739c"
set resourceGroupName="rg473384"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\northcentralus\template.json"
set parametersFilePath="C:\scale\home\northcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%