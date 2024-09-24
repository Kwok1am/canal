# canal

一个开箱即用的 http / socks5 代理（基于 Cloudflare WARP）

Setting Up an Out of Box HTTP/SOCKS5 Proxy with Cloudflare WARP in Docker


## http 代理模式

### 部署

```
docker run -d -p 127.0.0.1:10000:10000 --name warpproxy ghcr.io/kwok1am/warpproxy:latest
```

### 测试

```
curl -x http://127.0.0.1:10000 ipinfo.io
```

## socks5 代理模式

### 部署

```
docker run -d -p 127.0.0.1:10000:10000/tcp -p 127.0.0.1:10000:10000/udp -e SOCKS5_MODE=true --name warpproxy ghcr.io/kwok1am/warpproxy:latest
```

### 测试

```
curl --socks5 127.0.0.1:10000 ipinfo.io
```

## 使用 WARP+（可选）

```
# 容器部署后，输入以下命令进入容器
docker exec -it canal bash

# 设置 WARP+ 的 license
warp-cli registration license <license id>

# 退出容器
exit

# 重启容器
docker restart canal
```

## License

MIT License
