set deploymentName="r459d0depcentralus"
set subscriptionId="f23f96dc-087f-4ed0-9d1f-021ddf39d48f"
set resourceGroupName="rg133623"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\centralus\template.json"
set parametersFilePath="C:\scale\home\centralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%