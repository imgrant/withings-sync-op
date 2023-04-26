#!/bin/sh
OP_ITEM="${OP_ITEM:=Garmin Connect}"
OP_VAULT="${OP_VAULT:=Automation}"
USERNAME_FIELDNAME="${USERNAME_FIELDNAME:=username}"
PASSWORD_FIELDNAME="${PASSWORD_FIELDNAME:=password}"
EVERY_N_HOURS="${EVERY_N_HOURS:=3}"

CMD="withings-sync --garmin-username \$(op read \"op://${OP_VAULT}/${OP_ITEM}/${USERNAME_FIELDNAME}\") --garmin-password \$(op read \"op://${OP_VAULT}/${OP_ITEM}/${PASSWORD_FIELDNAME}\")"

# Run the command once immediately
eval $CMD

# Then create a cron job to run at a random minute, every N hours
echo "$(( $RANDOM % 59 +0 )) */${EVERY_N_HOURS} * * * $CMD" > /etc/crontabs/root

# Execute passthrough args to this script (CMD from Dockerfile unless overriden)
eval "$@"