#!/bin/sh

# Defaults for name of 1Password vault and item to read
OP_ITEM="${OP_ITEM:=Garmin Connect}"
OP_VAULT="${OP_VAULT:=Automation}"

# Fetch Garmin Connect credentials from 1Password and export as environment variables
# N.b. Pass the 1Password service account token as the OP_SERVICE_ACCOUNT_TOKEN environment variable
if op_item=$(op item get "$OP_ITEM" --vault "$OP_VAULT" --fields username,password); then
  export GARMIN_USERNAME=$(echo "$op_item"|cut -d',' -f1)
  export GARMIN_PASSWORD=$(echo "$op_item"|cut -d',' -f2)
fi

# Hand off to the Docker CMD parameter
eval $1