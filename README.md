# Azure Key Vault Load Test

This will deploy a:
  Resource Group
  Azure Key Vault 
  Azure Load Test Portal

 This requires a Entra Service Principal that has the "Key Vault Secrets User" RBAC role assigned.

 The ClientId, ClientSecret, and TenantID need to be added to the AKV.JMX - Jmeter file for authentication and access.  This should be done BEFORE uploading the JMX file to Azure Load test.
 Further modification of Load parameters, (Duration, Concurrent Users, etc can also be changed.)

 ## Load Test Deployment

| Azure (Public) |
| :---: |
| <a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fjohndohoneyjr%2Fakv-simple-load-test%2Fmain%2Fdeployment%2Ftemplate.json" target="_blank"><img src="https://aka.ms/deploytoazurebutton" /></a> | 
