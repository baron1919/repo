set deploymentName="r459d0depcentralus"
set subscriptionId="022954fd-a4b9-4e6f-a3bf-440504173e94"
set resourceGroupName="rg204523"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\centralus\template.json"
set parametersFilePath="C:\scale\home\centralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%