# 构建阶段
FROM golang:1.24rc1-alpine3.20 as builder

# 设置环境变量
ARG TARGETPLATFORM=linux/amd64
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin"

# 安装必要的依赖和 Go 工具链
RUN apk add --no-cache tzdata ca-certificates curl git go

# 拷贝源文件
COPY Caddyfile /etc/naiveproxy/Caddyfile
COPY config.json /etc/naiveproxy/config.json
COPY xcaddy /usr/local/bin/xcaddy

# 编译 Caddy 和安装 naiveproxy 插件
RUN xcaddy build v2.8.4 \
     --with github.com/caddy-dns/cloudflare \
     --with github.com/mholt/caddy-l4 \
     --with github.com/mholt/caddy-webdav \
     --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

# 运行阶段
FROM alpine:3.21.0

# 拷贝编译后的 Caddy 可执行文件
COPY --from=builder /go/caddy /usr/bin/caddy
COPY --from=builder /usr/local/bin/xcaddy /usr/local/bin/xcaddy

# 拷贝配置文件
COPY Caddyfile /etc/naiveproxy/Caddyfile
COPY config.json /etc/naiveproxy/config.json

# 设置工作目录
WORKDIR /root

# 设置挂载点（如果需要）
VOLUME ["/etc/naiveproxy"]

# 设置默认的启动命令
CMD ["/bin/sh", "-c", "/usr/bin/caddy run --config /etc/naiveproxy/Caddyfile"]