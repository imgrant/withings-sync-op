#!/bin/sh
OP_ITEM="${OP_ITEM:=Garmin Connect}"
OP_VAULT="${OP_VAULT:=Automation}"
USERNAME_FIELDNAME="${USERNAME_FIELDNAME:=username}"
PASSWORD_FIELDNAME="${PASSWORD_FIELDNAME:=password}"
EVERY_N_HOURS="${EVERY_N_HOURS:=3}"
RANDOM_MINUTE=$(( $RANDOM % 59 +0 ))

CMD="withings-sync --garmin-username \$(op read \"op://${OP_VAULT}/${OP_ITEM}/${USERNAME_FIELDNAME}\") --garmin-password \$(op read \"op://${OP_VAULT}/${OP_ITEM}/${PASSWORD_FIELDNAME}\")"

# Run the command once immediately
echo "Starting initial sync ..."
eval $CMD

# Then create a cron job to run at a random minute, every N hours
echo "Scheduling sync every ${EVERY_N_HOURS} hours, at ${RANDOM_MINUTE} minutes past"
echo "$RANDOM_MINUTE */${EVERY_N_HOURS} * * * $CMD" > /etc/crontabs/root

# Execute passthrough args to this script (CMD from Dockerfile unless overriden)
eval "$@"