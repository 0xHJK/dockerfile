#!/bin/sh

RUN_MODE=client
SERVER_ADDRESS=127.0.0.1
SERVER_PORT=443
CLIENT_PORT=1080
# 注意把UUID改成和服务器一致
# UUID=`cat /proc/sys/kernel/random/uuid`
UUID=`uuidgen`
ALTERID=64

echo "UUID: ${UUID}"

docker run -d \
    --name v2ray-client \
    -e RUN_MODE=${RUN_MODE} \
    -e SERVER_ADDRESS=${SERVER_ADDRESS} \
    -e SERVER_PORT=${SERVER_PORT} \
    -e CLIENT_PORT=${CLIENT_PORT} \
    -e UUID=${UUID} \
    -e ALTERID=${ALTERID} \
    -p ${SERVER_PORT}:${SERVER_PORT} \
    v2ray-docker
