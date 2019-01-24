FROM alpine

MAINTAINER acmodeu <acmodeu@gmail.com>

#EXPOSE 8384 22000 21027/udp

#COPY --from=builder /usr/local/bin/airdcppd /bin/airdcppd
#COPY --from=builder /usr/local/share/airdcpp/web-resources /usr/local/share/airdcpp/web-resources

RUN apk add --no-cache su-exec

#ENV PUID=1000 PGID=1000
ADD airdcpp_latest_develop_64-bit_portable.tar.gz /

ENV PUID=1000 PGID=1000

#VOLUME [ "/data" ]
VOLUME [ "/data" , "/airdcpp-webclient/config" ]
#COPY WebServer.xml /airdcpp-webclient/config/WebServer.xml


#ENTRYPOINT \
#/bin/sh
#  chown "${PUID}:${PGID}" -R /airdcpp-webclient && \
#  su-exec "${PUID}:${PGID}" \
#  /airdcpp-webclient/airdcppd


#ENTRYPOINT [ "chown", "${PUID}:${PGID}", "-R", "/airdcpp-webclient", "&&", "su-exec", "${PUID}:${PGID}", "/airdcpp-webclient/airdcppd" ]

COPY ./script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]
#CMD ["--configure"]
