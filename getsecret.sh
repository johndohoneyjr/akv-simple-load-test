#!/bin/bash
set -x
# Azure AD details
tenant_id=""
client_id=""
client_secret=""
resource="https://vault.azure.net"

# Get access token from Azure AD
response=$(curl -X POST -d "grant_type=client_credentials&client_id=$client_id&client_secret=$client_secret&resource=$resource" https://login.microsoftonline.com/$tenant_id/oauth2/token)
access_token=$(echo $response | jq -r '.access_token')

# Azure Key Vault details
vault_name="dohoney-west"
secret_name="mysecret"

# measure the time IN MILLISECONDS  it takes to get the secret
start=$(date +%s%N)

# Get secret from Azure Key Vault
secret=$(curl -X GET -H "Authorization: Bearer $access_token" https://$vault_name.vault.azure.net/secrets/$secret_name?api-version=7.0)
secret_value=$(echo $secret | jq -r '.value')

# measure the time it takes to get the secret
end=$(date +%s%N)
elapsed_time=$(($end - $start))
# Convert nanoseconds to milliseconds
elapsed_time_ms=$(($elapsed_time / 1000000))

echo "It took $elapsed_time_ms milliseconds to get the secret"

echo "Secret Value: $secret_value"