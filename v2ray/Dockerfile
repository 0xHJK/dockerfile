FROM v2ray/official
LABEL maintainer HJKdev@gmail.com

ADD server.json /etc/v2ray/server.json
ADD client.json /etc/v2ray/client.json

ENV RUN_MODE=server \
    SERVER_ADDRESS=127.0.0.1 \
    SERVER_PORT=443 \
    CLIENT_PORT=1080 \
    UUID=18ff6e14-4f0c-4a6d-87be-61393d9b4fb8 \
    ALTERID=64

EXPOSE ${SERVER_PORT}
EXPOSE ${CLIENT_PORT}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
