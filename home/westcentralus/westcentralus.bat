set deploymentName="rd0depw9estcentralus"
set subscriptionId="a825c8a4-0107-422f-a12b-e30a848bde41"
set resourceGroupName="rg395912"
set resourceGroupLocation="southcentralus"



set templateFilePath="C:\scale\home\westcentralus\template.json"
set parametersFilePath="C:\scale\home\westcentralus\parameters.json"


az group deployment create --name "%deploymentName%" --resource-group "%resourceGroupName%" --template-file %templateFilePath% --parameters %parametersFilePath%