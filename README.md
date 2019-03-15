# dockerfile
常用的docker配置

一键安装docker：
```bash
curl -fsSL https://get.docker.com | bash
```

CentOS下需要手动启动docker：
```bash
# 启动
sudo systemctl start docker
# 开机启动
sudo systemctl enable docker
```

查看docker版本
```bash
docker -v
```

一键安装docker-compose：
```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```
> 注意这不是最新版docker-compose，最新版去github的releases中下载

或者可以使用pip安装
```bash
pip install docker-compose
```

查看docker-compose版本
```bash
docker-compose -v
```
