FROM aclemons/slackware:15.0

COPY entrypoint.sh /

VOLUME /packages
VOLUME /slackbuild
VOLUME /output

ENTRYPOINT ["bash", "entrypoint.sh"]
