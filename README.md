<!-- DON'T EDIT HERE, THIS IS GENERATED ON COMMIT -->
<!-- EDIT: $ vim ./scripts/gen-readme -->

# Install Scripts

Install apps in easy way from the command line

## Usage

- **4kvideodownloader** (GUI)

```sh
wget -qO - https://git.io/JTlFT?=4kvideodownloader-ubuntu | bash
```

- **aws-cli**

```sh
wget -qO - https://git.io/JTlb6?=aws-cli-linux | bash
```

- **brew**

```sh
wget -qO - https://git.io/JTlbH?=brew-ubuntu | bash
```

- **docker**

```sh
wget -qO - https://git.io/JJaKZ?=docker-ubuntu | bash
```

- **electrum** (GUI)

```sh
wget -qO - https://git.io/JTlNe?=electrum-linux | bash
```

- **google-chrome** (GUI)

```sh
wget -qO - https://git.io/JTlNm?=google-chrome-ubuntu | bash
```

- **popcorn-time** (GUI)

```sh
wget -qO - https://git.io/JTlNs?=popcorn-time-ubuntu | bash
```

- **postman** (GUI)

```sh
wget -qO - https://git.io/JTlNZ?=postman-linux | bash
```

- **staruml** (GUI)

```sh
wget -qO - https://git.io/JTlNn?=staruml-linux | bash
```

- **stremio** (GUI)

```sh
wget -qO - https://git.io/JTlNl?=stremio-ubuntu | bash
```

- **telegram** (GUI)

```sh
wget -qO - https://git.io/JTlNB?=telegram-linux | bash
```

- **vagrant**

```sh
wget -qO - https://git.io/JTlNR?=vagrant-ubuntu | bash
```

- **vscode** (GUI)

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

