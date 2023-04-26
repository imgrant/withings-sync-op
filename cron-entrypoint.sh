#!/bin/sh
OP_ITEM="${OP_ITEM:=Garmin Connect}"
OP_VAULT="${OP_VAULT:=Automation}"
echo "$(( $RANDOM % 59 +0 )) */3 * * * withings-sync --garmin-username $(op read "op://$OP_VAULT/$OP_ITEM/username") --garmin-password $(op read "op://$OP_VAULT/$OP_ITEM/password") | tee -a /root/withings-sync.log" > /etc/crontabs/root
crond -f -l 6 -L /dev/stdout