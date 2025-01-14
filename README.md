# build-naiveproxy-docker：
使用Dockerfile文件构建自己的naiveproxy镜像，实现使用docker-compose方式部署naiveproxy代理

# 文件结构如下：
tree /home/naiveproxy-docker_test
/home/naiveproxy-docker_test
├── caddy
├── caddy_2.9.0_linux_amd64.tar.gz
├── Caddyfile
├── config.json
├── docker-compose.yml
├── Dockerfile
├── README.md
├── xcaddy
└── xcaddy_0.4.4_linux_amd64.tar.gz

# 1、文件结构：
```
root@hcss-ecs-3a1a:/home# tree /home/naiveproxy-docker_test
/home/naiveproxy-docker_test
├── caddy
├── caddy_2.9.0_linux_amd64.tar.gz
├── Caddyfile
├── config.json
├── docker-compose.yml
├── Dockerfile
├── README.md
├── xcaddy
└── xcaddy_0.4.4_linux_amd64.tar.gz
```

# 2、目录中用到的文件下载地址：
#### 2.1、caddy_2.9.0_linux_amd64.tar.gz 下载地址：
	https://github.com/caddyserver/caddy/releases
	解压caddy_2.9.0_linux_amd64.tar.gz文件 并改名为caddy

#### 2.2、xcaddy_0.4.4_linux_amd64.tar.gz 下载地址：
	https://github.com/caddyserver/xcaddy/releases
	解压xcaddy_0.4.4_linux_amd64.tar.gz文件 并改名为xcaddy

#### 2.3、dockerhub参考地址：
	https://hub.docker.com/r/pocat/naiveproxy

#### 2.4、从我的GitHub上拉取代码构建镜像地址：
