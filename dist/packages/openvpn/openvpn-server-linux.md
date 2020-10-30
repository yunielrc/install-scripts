```sh
wget -qO - https://git.io/JT9G2?=openvpn-server-linux | bash
```

With custom parameters:
_al parameters are optional_

```sh
wget -qO -  https://git.io/JT9G2?=openvpn-server-linux | \
  WORKING_DIR=<work dir> \
  OPENVPN_CLIENT_NAME=<vpn client name> \
  OPENVPN_HOST=<vpn host> \
  OPENVPN_PORT=<vpn port> \
  OPENVPN_PROTOCOL=<vpn protocol> \
  bash
```
