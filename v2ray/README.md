# v2ray-docker

v2ray-core是一款优秀的代理软件，但是配置相对有点复杂。

本镜像适用于大多数只想自由地访问互联网，不愿意太折腾的人。

## 使用方式

首先需要一台海外VPS，推荐使用新版的ubuntu或debian系统。

安装docker：
```bash
# 官方一键安装脚本
$ sudo curl -fsSL https://get.docker.com | bash
# 如果需要非root身份使用docker，则使用以下命令后重新登录
# your-user是你的用户名
$ sudo usermod -aG docker your-user
```

构建镜像：
```bash
$ cd dockerfile/v2ray/
$ ./build.sh
Sending build context to Docker daemon 9.728kB
Step 1/9 : FROM v2ray/official
latest: Pulling from v2ray/official
4fe2ade4980c: Pull complete
1d0f948b52da: Pull complete
cfe4ab2b4bf9: Pull complete
10d251271f5f: Pull complete
e72971d2ae05: Pull complete
854a2b63ca5c: Pull complete
34bd60064729: Pull complete
Digest: sha256:bf6972d77d4b4e7bbe599793c3e8a21e28b6c801d3faa9c31d89b38c5f086635
Status: Downloaded newer image for v2ray/official:latest
---> 65781f24504c
Step 2/9 : LABEL maintainer HJKdev@gmail.com
---> Running in c045ecd04049
Removing intermediate container c045ecd04049
---> 1b7554fe2385
Step 3/9 : ADD server.json /etc/v2ray/server.json
---> 8e030f026024
Step 4/9 : ADD client.json /etc/v2ray/client.json
---> f300738e8fd5
Step 5/9 : ENV RUN_MODE=server SERVER_ADDRESS=127.0.0.1 SERVER_PORT=443 CLIENT_PORT=1080 UUID=18ff6e14-4f0c-4a6d-87be-61393d9b4fb8 ALTERID=64
---> Running in 4a3687976d85
Removing intermediate container 4a3687976d85
---> ce7b9ab0a1e7
Step 6/9 : EXPOSE ${SERVER_PORT}
---> Running in 7ea550e72c46
Removing intermediate container 7ea550e72c46
---> 210f90769e6d
Step 7/9 : EXPOSE ${CLIENT_PORT}
---> Running in dce59667237f
Removing intermediate container dce59667237f
---> 5b0abee10302
Step 8/9 : ADD entrypoint.sh /entrypoint.sh
---> 9b03da101351
Step 9/9 : ENTRYPOINT [ "/entrypoint.sh" ]
---> Running in a0adadfba035
Removing intermediate container a0adadfba035
---> c5d85f22bb4e
Successfully built c5d85f22bb4e
Successfully tagged v2ray-docker:latest
```

## v2ray服务器

构建镜像完成后，启动Server：
```
./run-server.sh
```

## v2ray客户端

启动Server之后会输出一个UUID，记录这个UUID，替换掉`run-client.sh`中的`UUID`，同时修改`run-client.sh`中的`SERVER_ADDRESS`为VPS的IP或域名。

构建镜像完成启动Client：
```
./run-client.sh
```

当然，如果你喜欢有UI的客户端，可以在这里下载：<https://www.v2ray.com/ui_client/>

## 默认配置
- 服务器地址 127.0.0.1 （必须修改）
- 服务器端口 443
- 客户端端口 1080
- 客户端和服务器通信协议 vmess
- 客户端本地通信协议 socks5
- alterID 64
- UUID 自动生成 （客户端和服务器必须改成一致）

如果简单的改动直接修改`run-server.sh`或`run-client.sh`即可，复杂的改动就需要改json文件了。
