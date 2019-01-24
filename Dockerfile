FROM alpine

MAINTAINER acmodeu <acmodeu@gmail.com>

RUN apk add --no-cache su-exec

RUN wget http://web-builds.airdcpp.net/develop/airdcpp_latest_develop_64-bit_portable.tar.gz && \
tar zxf airdcpp_latest_develop_64-bit_portable.tar.gz \
rm airdcpp_latest_develop_64-bit_portable.tar.gz

#ADD airdcpp_latest_develop_64-bit_portable.tar.gz /

ENV PUID=1000 PGID=1000

VOLUME [ "/data" , "/airdcpp-webclient/config" ]

COPY ./script.sh /
RUN chmod +x /script.sh
ENTRYPOINT ["/script.sh"]
