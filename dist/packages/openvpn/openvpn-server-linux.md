```sh
wget -qO - https://git.io/JT9Yd?=openvpn-server-linux | bash
```

With custom parameters:

```sh
wget -qO -  https://git.io/JT9Yd?=openvpn-server-linux | \
  OPENVPN_HOST=<vpn host here> \          # optional
  OPENVPN_PORT=<vpn port here> \          # optional
  OPENVPN_PROTOCOL=<vpn protocol here> \  # optional
  bash
```
