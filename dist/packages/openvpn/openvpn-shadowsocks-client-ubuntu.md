Prerequisites:<br/>

- openvpn + shadowsocks server

if you have aws account you can setup an ec2 intance with terraform:<br/>

[ec2 instance: openvpn + shadowsocks server + http proxy](https://github.com/yunielrc/iac-aws-terraform/tree/main/openvpn-shadowsocks-proxy)

Or install with a script in your server:<br/>

[openvpn + shadowsocks server install script](wget -qO - <https://git.io/JT9Gz?=openvpn-shadowsocks-server-linux> | bash)

Install openvpn + shadowsocks client:<br/>

```sh
wget -qO -  https://git.io/JT9Gz?=openvpn-shadowsocks-client-ubuntu |
  WORKING_DIR=<work_dir> \                      # defautl: working directory  [optional]
  SS_SERVER_IP=<ss_server_ip> \                 #                             [required]
  SS_SERVER_PORT=<ss_server_port> \             #                             [required]
  SS_PASSWORD=<ss_password> \                   #                             [required]
  SS_PORT=<ss_port> \                           #                             [required]
  OPENVPN_PROFILE_FILE=<openvpn_profile_file> \ # with shadowsock proxy       [required]
  TOGGLE_VPN_KEYBIND=<toggle_vpn_keybind> \     # default: <Ctrl><Shift>F8    [optional]
  bash
```

docker-compose.yml template

```yml
version: "3.4"

services:
  ssclient:
    image: yunielrc/shadowsocks-rust-client
    restart: always
    container_name: ssclient
    environment:
      - "SS_SERVER_IP=${ss_server_ip}"
      - "SS_SERVER_PORT=${ss_server_port}"
      - "SS_PASSWORD=${ss_server_password}"
      - "SS_PLUGIN=v2ray-plugin"
    ports:
      - "${ss_port}:1080"
```
