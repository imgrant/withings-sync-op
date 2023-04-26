FROM ghcr.io/jaroslawhartman/withings-sync:master
LABEL org.opencontainers.image.source=https://github.com/imgrant/withings-sync-op
LABEL org.opencontainers.image.description="Withings>Garmin sync, with 1Password"
LABEL org.opencontainers.image.licenses=MIT

COPY --from=1password/op:2-beta /usr/local/bin/op /usr/local/bin/
COPY cron-entrypoint.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/cron-entrypoint.sh" ]
CMD [ "crond",  "-f", "-l", "6", "-L", "/dev/stdout" ]