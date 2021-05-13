# Azure Resource Manager Template + Azure CLI: Windows Basic WebApp 

In this project we'll get to know how to deploying an app to the cloud using an Azure Resource Manager template (ARM template) and Azure CLI.

An *ARM template* is a *JavaScript Object Notation (JSON)* file that defines the infrastructure and configuration for our project. The template uses declarative syntax. In declarative syntax, you describe your intended deployment without writing the sequence of programming commands to create the deployment.

To deploy our Windows Basic WebApp we are having 3 files, 2 `.json` files and one `bash` file:
  1. azuredeploy.json
  2. azuredeploy.parameters.json
  3. azuredeploy.sh


## Review the template file ([azuredeploy.json](https://github.com/jainayu/webapp-basic-windows-azure-template/blob/main/azuredeploy.json))

It deploys an App Service plan and an App Service app. It's compatible with .NET Core, .NET Framework, PHP, Node.js, and Static HTML apps.

This template contains several parameters that are having crertain default values as well. You can see the table below for parameter defaults and their descriptions:

Parameters	| Type	    | Default value	                | Description
------------|-----------|-------------------------------|---------------------
webAppName	| string	| "webApp-\<uniqueString>"	    | App name
location	| string	| "[resourceGroup().location]"	| App region
sku	        | string	| "F1"	                        | Instance size (F1 = Free Tier)
language	| string	| ".net"	                    | Programming language stack (.net, php, node, html)
repoUrl	    | string	| " "	                        | External Git repo (optional)

Two Azure resources are defined in the template:
- Microsoft.Web/serverfarms: create an App Service plan.
- Microsoft.Web/sites: create an App Service app.


## Reviewing the parameter file ([azuredeploy.parameters.json](https://github.com/jainayu/webapp-basic-windows-azure-template/blob/main/azuredeploy.parameters.json))

This file contains the parameters that will be used to create the resource.

```json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
    "contentVersion": "1.0.0.0",
    "parameters": {
        "webAppName": {
            "value": "windowsbasicwebapp"
        }
    }
}
```

## Deploying the template ([azuredeploy.sh](https://github.com/jainayu/webapp-basic-windows-azure-template/blob/main/azuredeploy.sh))

Here I have made a shell script using Azure CLI to deploy the teamplate. 

```bash
RGName="rg-practice-dev-in-004"
TemplateFilePath="./azuredeploy.json"
ParameterFilePath="./azuredeploy.parameters.json"

az deployment group create --resource-group $RGName --template-file $TemplateFilePath --parameters $ParameterFilePath
```

The following code deploys the Windows Basic WebApp using the template file.


----------

### Refrences

- [Quickstart: Create App Service app using an ARM template](https://docs.microsoft.com/en-us/azure/app-service/quickstart-arm-template?pivots=platform-windows)
- [Azure Quickstart Templates](https://github.com/Azure/azure-quickstart-templates/tree/master/quickstarts/microsoft.web/webapp-basic-windows)
- [App Service Quickstart - Windows app](https://azure.microsoft.com/en-us/resources/templates/101-app-service-docs-windows/)
