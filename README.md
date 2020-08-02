# Install Scripts

## Usage

- **4kvideodownloader** (GUI)

ubuntu:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/4kvideodownloader/4kvideodownloader-ubuntu | bash
```

- **aws-cli**

linux:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/aws-cli/aws-cli-linux | bash
```

- **brew**

ubuntu:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/brew/brew-ubuntu | bash
```

- **docker & docker-compose**

ubuntu:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/docker/docker-ubuntu | bash
```

- **electrum**

linux:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/electrum/electrum-linux | bash
```

- **google-chrome**

ubuntu:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/google-chrome/google-chrome-ubuntu | bash
```

- **vagrant**

ubuntu:

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/vagrant/vagrant-ubuntu | bash
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
