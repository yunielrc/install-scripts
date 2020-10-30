```sh
wget -qO - https://git.io/JT9Yb?=openvpn-shadowsocks-server-linux | bash
```

With custom parameters:

```sh
wget -qO -  https://git.io/JT9Yb?=openvpn-shadowsocks-server-linux | \
  SS_CLIENT_PORT=<shadowsocks client port> \  # optional
  SS_PORT=<shadowsocks server port here> \    # optional
  SS_PASSWORD=<shadowsocks password here> \   # optional
  bash
```
