set deploymentName="r459d0depcentralus"
set subscriptionId="fd19faab-b635-424b-84ae-384249a593ee"
set resourceGroupName="rg461614"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\centralus\template.json"
set parametersFilePath="C:\scale\home\centralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%