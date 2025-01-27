# 需求：
使用Dockerfile文件构建自己的naiveproxy镜像，实现使用docker-compose方式部署naiveproxy代理

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

# 3、封装镜像、达标签、推送到docker hub仓库：
#### 3.1、使用Dockerfile文件封装镜像：
	docker build -f Dockerfile -t naiveproxy:v3 .
	docker build -f Dockerfile所在目录 -t 镜像名[naiveproxy]:镜像版本[v3] .   # . 是当前目录的意思

#### 3.2、打标签：
	docker tag naiveproxy:v3 zorn0zhao/naiveproxy:v3
	dokcer tag 刚才构建的镜像名[naiveproxy]:刚才构建的镜像版本[v3] dockerhub仓库地址[zorn0zhao/naiveproxy]:dockerhub仓库版本[v3]

#### 3.3、推送镜像到 docker hub仓库：
	docker push zorn0zhao/naiveproxy:v3
	docker push dockerhub仓库地址[zorn0zhao/naiveproxy]:dockerhub仓库版本[v3]

# 4、验证服务是否启动：
```
cd /etc/naiveproxy/
docker-compose ps -a 
NAME                COMMAND                  SERVICE             STATUS              PORTS
naiveproxy          "/bin/sh -c '/usr/bi…"   naiveproxy          running    

netstat -tunlp 
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      279/systemd-resolve 
tcp6       0      0 :::80                   :::*                    LISTEN      211269/caddy        
tcp6       0      0 :::443                  :::*                    LISTEN      211269/caddy        
udp        0      0 127.0.0.53:53           0.0.0.0:*                           279/systemd-resolve 
udp6       0      0 :::443                  :::*                                211269/caddy
```

# 5、注意事项：
该服务主要使用的80、443端口，注意端口不要被占用

