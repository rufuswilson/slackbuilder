FROM aclemons/slackware:15.0

COPY entrypoint.sh /

VOLUME /build-deps
VOLUME /slackbuild
VOLUME /output
VOLUME /logs

ENTRYPOINT ["bash", "entrypoint.sh"]
