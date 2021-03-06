<br/>

```sh
wget -qO -  https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/shadowsocks/shadowsocks-client-alpine |
  SS_SERVER_IP=<shadowsocks_server_ip>  \
  SS_SERVER_PORT=<shadowsocks_server_port>  \
  SS_SERVER_PASSWORD=<shadowsocks_server_password>  \
  SS_PORT=<shadowsocks_port:-1080>  \                      # [DEFAULT]
  SS_TIMEOUT=<shadowsocks_timeout:-300> \                  # [DEFAULT]
  SS_ENCRYPT_METHOD=<ss_encrypt_method:-aes-256-gcm> \     # [DEFAULT]
  SS_PLUGIN=<shadowsocks_plugin>  \                        # [OPTIONAL, eg: v2ray-plugin]
  sh
```

Just install sslocal & v2ray-plugin binaries, don't configure anything. Useful for updating

```sh
wget -qO -  https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/shadowsocks/shadowsocks-client-alpine |
  NOCONFIGURE=true  sh
```
