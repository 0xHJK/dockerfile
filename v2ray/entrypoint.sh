#!/bin/sh

# 根据环境变量替换配置文件信息
sed -i "s/SERVER_PORT/${SERVER_PORT}/" /etc/v2ray/server.json
sed -i "s/UUID/${UUID}/" /etc/v2ray/server.json
sed -i "s/ALTERID/${ALTERID}/" /etc/v2ray/server.json

sed -i "s/CLIENT_PORT/${CLIENT_PORT}/" /etc/v2ray/client.json
sed -i "s/SERVER_ADDRESS/${SERVER_ADDRESS}/" /etc/v2ray/client.json
sed -i "s/SERVER_PORT/${SERVER_PORT}/" /etc/v2ray/client.json
sed -i "s/UUID/${UUID}/" /etc/v2ray/client.json
sed -i "s/ALTERID/${ALTERID}/" /etc/v2ray/client.json

echo "RUN_MODE: ${RUN_MODE}"

if [ ${RUN_MODE} = 'server' ]; then
    echo "starting v2ray server ${UUID}"
    v2ray -config=/etc/v2ray/server.json
else
    echo "starting v2ray client ${UUID}"
    v2ray -config=/etc/v2ray/client.json
fi
