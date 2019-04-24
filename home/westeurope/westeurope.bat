set deploymentName="r459d0depwestus2"
set subscriptionId="022954fd-a4b9-4e6f-a3bf-440504173e94"
set resourceGroupName="rg988040"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westeurope\template.json"
set parametersFilePath="C:\scale\home\westeurope\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%