RGName="rg-practice-dev-in-004"
TemplateFilePath="./azuredeploy.json"
ParameterFilePath="./azuredeploy.parameters.json"

##### Deploy the Windows basic Web App
az deployment group create --resource-group $RGName --template-file $TemplateFilePath --parameters $ParameterFilePath