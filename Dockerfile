FROM alpine:latest
LABEL maintainer="alphabet5"

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache dnsmasq bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--server=1.1.1.1", "--server=9.9.9.9"]
