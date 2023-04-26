#!/bin/sh
OP_ITEM="${OP_ITEM:=Garmin Connect}"
OP_VAULT="${OP_VAULT:=Automation}"
USERNAME_FIELDNAME="${USERNAME_FIELDNAME:=username}"
PASSWORD_FIELDNAME="${PASSWORD_FIELDNAME:=password}"
EVERY_N_HOURS="${EVERY_N_HOURS:=3}"
echo "$(( $RANDOM % 59 +0 )) */${EVERY_N_HOURS} * * * withings-sync --garmin-username $(op read "op://${OP_VAULT}/${OP_ITEM}/${USERNAME_FIELDNAME}") --garmin-password $(op read "op://${OP_VAULT}/${OP_ITEM}/${PASSWORD_FIELDNAME}") | tee -a /root/withings-sync.log" > /etc/crontabs/root
crond -f -l 6 -L /dev/stdout