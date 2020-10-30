```sh
wget -qO - https://git.io/JT9Gz?=openvpn-shadowsocks-server-linux | bash
```

With custom parameters:
_al parameters are optional_

```sh
wget -qO -  https://git.io/JT9Gz?=openvpn-shadowsocks-server-linux |
  WORKING_DIR=<work dir> \                    # current directory               [default]
  SS_CLIENT_PORT=<shadowsocks client port> \  # 1080                            [default]
  SS_PORT=<shadowsocks server port here> \    # 443                             [default]
  SS_PASSWORD=<shadowsocks password here> \   # $(openssl rand -base64 32)      [default]
  OPENVPN_CLIENT_NAME=<vpn client name> \     # client-$(openssl rand -hex 5)   [default]
  bash
```

docker-compose.yml template

```yml
version: "3.3"

services:
  openvpn:
    image: "kylemanna/openvpn:2.4"
    container_name: openvpn
    restart: always
    expose:
      - "1194"
    volumes:
      - "openvpn_data:/etc/openvpn"
    cap_add:
      - NET_ADMIN

  ssserver:
    image: yunielrc/shadowsocks-rust-server
    restart: always
    container_name: ssserver
    environment:
      - "SS_PASSWORD=${ss_password}"
      - "SS_PLUGIN=v2ray-plugin"
      - "SS_PLUGIN_OPTS=server"
    ports:
      - "${ss_port}:8388"

volumes:
  openvpn_data:
```
