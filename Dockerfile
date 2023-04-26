FROM ghcr.io/jaroslawhartman/withings-sync:master

COPY --from=1password/op:2-beta /usr/local/bin/op /usr/local/bin/
COPY gc_creds_from_1p.sh /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/gc_creds_from_1p.sh" ]
CMD [ "withings-sync" ]