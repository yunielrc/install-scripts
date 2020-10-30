```sh
wget -qO - https://git.io/JT9Gz?=openvpn-shadowsocks-server-linux | bash
```

With custom parameters:
_al parameters are optional_

```sh
wget -qO -  https://git.io/JT9Gz?=openvpn-shadowsocks-server-linux | \
  WORKING_DIR=<work dir> \
  SS_CLIENT_PORT=<shadowsocks client port> \
  SS_PORT=<shadowsocks server port here> \
  SS_PASSWORD=<shadowsocks password here> \
  OPENVPN_CLIENT_NAME=<vpn client name> \
  bash
```
