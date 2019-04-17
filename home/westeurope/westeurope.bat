set deploymentName="r459d0depwestus2"
set subscriptionId="a825c8a4-0107-422f-a12b-e30a848bde41"
set resourceGroupName="rg395912"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westeurope\template.json"
set parametersFilePath="C:\scale\home\westeurope\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%