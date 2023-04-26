#!/bin/sh
/usr/local/bin/gc_creds_from_1p.sh
echo "$(( $RANDOM % 59 +0 )) */3 * * * withings-sync --garmin-username $GARMIN_USERNAME --garmin-password $GARMIN_PASSWORD | tee -a /root/withings-sync.log" > /etc/crontabs/root
crond -f -l 6 -L /dev/stdout