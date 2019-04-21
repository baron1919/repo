set deploymentName="r459d0depcentralus"
set subscriptionId="6f880614-2059-42a0-b55e-18bf87b6511c"
set resourceGroupName="rg056032"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\centralus\template.json"
set parametersFilePath="C:\scale\home\centralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%