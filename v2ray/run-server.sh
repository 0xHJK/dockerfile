#!/bin/sh

RUN_MODE=server
SERVER_PORT=443
# UUID=`cat /proc/sys/kernel/random/uuid`
UUID=`uuidgen`
ALTERID=64

echo "UUID: ${UUID}"

docker run -d \
    --name v2ray-server \
    -e RUN_MODE=${RUN_MODE} \
    -e SERVER_PORT=${SERVER_PORT} \
    -e UUID=${UUID} \
    -e ALTERID=${ALTERID} \
    -p ${SERVER_PORT}:${SERVER_PORT} \
    v2ray-docker
