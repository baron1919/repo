set deploymentName="r459d0depeastus2"
set subscriptionId="022954fd-a4b9-4e6f-a3bf-440504173e94"
set resourceGroupName="rg204523"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus2\template.json"
set parametersFilePath="C:\scale\home\eastus2\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%