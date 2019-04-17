set deploymentName="r459d0depeastus"
set subscriptionId="a825c8a4-0107-422f-a12b-e30a848bde41"
set resourceGroupName="rg395912"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\eastus\template.json"
set parametersFilePath="C:\scale\home\eastus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%