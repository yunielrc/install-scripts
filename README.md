<!-- DON'T EDIT HERE, THIS IS GENERATED ON COMMIT -->
<!-- EDIT: $ vim ./scripts/gen-readme -->

# Install Scripts

Install apps in easy way from the command line

## Usage

- **4kvideodownloader** (GUI)


> 4kvideodownloader-ubuntu
```sh
wget -qO - https://git.io/JTlFT?=4kvideodownloader-ubuntu | bash
```
- **aws-cli**


> aws-cli-linux
```sh
wget -qO - https://git.io/JTlb6?=aws-cli-linux | bash
```
- **brew**


> brew-ubuntu
```sh
wget -qO - https://git.io/JTlbH?=brew-ubuntu | bash
```
- **docker**


> docker-ubuntu
```sh
wget -qO - https://git.io/JJaKZ?=docker-ubuntu | bash
```
- **electrum** (GUI)


> electrum-linux
```sh
wget -qO - https://git.io/JTlNe?=electrum-linux | bash
```
- **google-chrome** (GUI)


> google-chrome-ubuntu
```sh
wget -qO - https://git.io/JTlNm?=google-chrome-ubuntu | bash
```
- **opensnitch**


> opensnitch-ubuntu
```sh
wget -qO - https://git.io/JT6Fo?=opensnitch-ubuntu | bash
```
- **openvpn**


> openvpn-shadowsocks-client-ubuntu
<br/>
Requirements:<br/>

- openvpn + shadowsocks server

if you have an aws account you can setup an ec2 intance with terraform:<br/>

[ec2 instance: openvpn + shadowsocks server + http proxy](https://github.com/yunielrc/iac-aws-terraform/tree/main/openvpn-shadowsocks-proxy)

Or install in your server:<br/>

```sh
# dependencies: docker, docker-compose
wget -qO - https://git.io/JT9Gz?=openvpn-shadowsocks-server-linux | bash
```

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

> openvpn-shadowsocks-server-linux
<br/>
Dependencies: <br/>

- docker
- docker-compose

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
  OPENVPN_CLIENT_NAME=<vpn client name> \     # profile-${PUBLIC_IP}            [default]
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
      - "1194/tcp"
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
      - "${ss_port}:8388/tcp"
      - "${ss_port}:8388/udp"

volumes:
  openvpn_data:
```

> scripts/vpn-toggle
```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/openvpn/scripts/vpn-toggle | bash
```

> openvpn-server-linux
<br/>
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
- **popcorn-time** (GUI)


> popcorn-time-ubuntu
```sh
wget -qO - https://git.io/JTlNs?=popcorn-time-ubuntu | bash
```
- **postman** (GUI)


> postman-linux
```sh
wget -qO - https://git.io/JTlNZ?=postman-linux | bash
```
- **staruml** (GUI)


> staruml-linux
```sh
wget -qO - https://git.io/JTlNn?=staruml-linux | bash
```
- **stremio** (GUI)


> stremio-ubuntu
```sh
wget -qO - https://git.io/JTlNl?=stremio-ubuntu | bash
```
- **telegram** (GUI)


> telegram-linux
```sh
wget -qO - https://git.io/JTlNB?=telegram-linux | bash
```
- **vagrant**


> vagrant-ubuntu
```sh
wget -qO - https://git.io/JTlNR?=vagrant-ubuntu | bash
```
- **vscode** (GUI)


> vscode-ubuntu
```sh
wget -qO - https://git.io/JTlNu?=vscode-ubuntu | bash
```
## If you want to test

OS: ubuntu 20.04

### Prerequisites

before testing you need to do this:

```sh
$ git clone https://github.com/yunielrc/install-scripts.git && cd ./install-scripts
$ ./setup-devenv # setup your development environment
$ vim .env # ... put your settings
```

### Testing

- **Local** testing inside **docker container**

```sh
# test specific installation script
$ ./dcrun test ./dist/packages/vagrant/test/vagrant.bats
# test all installation scripts
$ ./dcrun test
```

- **Remote** testing inside a **docker container** (reusable environment)

```sh
$ vagrant up docker --provision --provider=aws
$ vagrant ssh docker
# test specific installation script
> on-remote $ ./dcrun test ./dist/packages/vagrant/test/vagrant.bats
# test all installation scripts
> on-remote $ ./dcrun test
> on-remote $ exit
$ vagrant halt -f docker # OR $ vagrant destroy -f docker
```

- **Remote** testing directly in the **virtual machine** (not reusable environment)

```sh
$ vagrant up vm --provision --provider=aws
$ vagrant ssh vm
# test specific installation script
> on-remote $ ./scripts/test ./dist/packages/vagrant/test/vagrant.bats
# test all installation scripts
> on-remote $ ./scripts/test
> on-remote $ exit
$ vagrant destroy -f vm
```

- **Remote** testing gui apps directly in the **virtual machine with a vnc server** (not reusable environment)

```sh
$ vagrant up vnc --provision --provider=aws
$ vagrant ssh vnc
# install gui app
> on-remote $ wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/4kvideodownloader/4kvideodownloader-ubuntu | bash
# copy remote vm public ip
> on-remote $ dig +short myip.opendns.com @resolver1.opendns.com
> on-remote $ exit
$ vncviewer DIG_OUTPUT_HERE:5901
# on remote: launch 4k video downloader app
# later, when testing is done run:
$ vagrant destroy -f vnc
```

