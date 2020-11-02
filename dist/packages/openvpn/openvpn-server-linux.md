Dependencies: <br/>

- docker
- docker-compose

```sh
wget -qO - https://git.io/JT9G2?=openvpn-server-linux | bash
```

With custom parameters:
_al parameters are optional_

```sh
wget -qO -  https://git.io/JT9G2?=openvpn-server-linux |
  WORKING_DIR=<work dir> \                 # current directory              [default]
  OPENVPN_CLIENT_NAME=<vpn client name> \  # profile-${PUBLIC_IP}           [default]
  OPENVPN_HOST=<vpn host> \                # server public ip               [default]
  OPENVPN_PORT=<vpn port> \                # 1194                           [default]
  OPENVPN_PROTOCOL=<vpn protocol> \        # udp                            [default]
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
    ports:
      - "${openvpn_port}:1194/${openvpn_protocol}"
    volumes:
      - "openvpn_data:/etc/openvpn"
    cap_add:
      - NET_ADMIN

volumes:
  openvpn_data:
```
