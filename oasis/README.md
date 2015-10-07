## oasis development construct
1. download & install virtualbox
[home](https://www.virtualbox.org/wiki/Downloads)
[OS X](http://download.virtualbox.org/virtualbox/4.3.28/VirtualBox-4.3.28-100309-OSX.dmg)

2. download & install vagrant
[home](https://www.vagrantup.com/downloads.html)
[OS X](https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.dmg)

3. location project

```bash
alias va=vagrant
mkdir vm/oasis
va up
```

4. build images
```sh
docker build -f=Dockerfile_ubuntu -t oasis/ubuntu:0.1 .
docker build -f=Dockerfile_java -t oasis/jvm:0.1 .
docker build -f=Dockerfile_mongodb -t oasis/mongo:0.1 .
```
