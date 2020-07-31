# Install Scripts

## Usage

- docker & docker-compose

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/docker/docker-ubuntu | bash
```

- vagrant

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/vagrant/vagrant-ubuntu | bash
```

- 4kvideodownloader (GUI)

```sh
wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/4kvideodownloader/4kvideodownloader-ubuntu | bash
```

## If you want to test

### Prerequisites

Before testing you need:

```sh
$ git clone https://github.com/yunielrc/install-scripts.git && cd ./install-scripts
$ ./setup-devenv
```

### Testing

- Local testing inside docker

```sh
# test specific installation script
$ ./dcrun test ./dist/packages/vagrant/test/vagrant.bats
# test all installation scripts
$ ./dcrun test
```

- Remote testing inside docker (reusable environment)

```sh
$ vagrant up docker --provision --provider=aws
$ vagrant ssh docker
# test specific installation script
> on-remote $ ./dcrun test ./dist/packages/vagrant/test/vagrant.bats
# test all installation script
> on-remote $ ./dcrun test
> on-remote $ exit
$ vagrant destroy -f docker # OR $ vagrant halt -f docker
```

- Remote testing directly in a vm (not reusable environment)

```sh
$ vagrant up vm --provision --provider=aws
$ vagrant ssh vm
# test specific installation script
> on-remote $ ./scripts/test ./dist/packages/vagrant/test/vagrant.bats
# test all installation script
> on-remote $ ./scripts/test
> on-remote $ exit
$ vagrant destroy -f vm
```

- Remote testing gui apps directly in a vm with vnc server (not reusable environment)

```sh
$ vagrant up vnc --provision --provider=aws
$ vagrant ssh vm
# install gui app
> on-remote $ wget -qO - https://raw.githubusercontent.com/yunielrc/install-scripts/master/dist/packages/4kvideodownloader/4kvideodownloader-ubuntu | bash
# copy remote vm public ip
> on-remote $ dig +short myip.opendns.com @resolver1.opendns.com
> on-remote $ exit
$ vncviewer DIG_OUTPUT_HERE:5901
# later, when testing is done run:
$ vagrant destroy -f vm
```
