FROM debian:12-slim

WORKDIR /app/

COPY start.sh /app/start.sh

RUN apt-get update && apt-get install -y curl gnupg wget lsb-release dbus && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list && \
    apt-get update && apt-get install -y cloudflare-warp && \
    wget -O gost.tar.gz "https://github.com/go-gost/gost/releases/download/v3.0.0-rc10/gost_3.0.0-rc10_linux_amd64v3.tar.gz" && tar -C /app/ -xzf /app/*.tar.gz && \
    chmod +x /app/gost && chmod +x /app/start.sh

EXPOSE 10000

CMD [ "/bin/sh", "/app/start.sh" ]