# development construct with Docker and Vagrant

## Download & install virtualbox
* [home page](https://www.virtualbox.org/wiki/Downloads)
* [download for OS X](http://download.virtualbox.org/virtualbox/4.3.28/VirtualBox-4.3.28-100309-OSX.dmg)

## Download & install vagrant
* [home page](https://www.vagrantup.com/downloads.html)
* [download for OS X](https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.dmg)

## Enter VM
start VM with vagrant
```bash
alias va=vagrant
mkdir vm/oasis
va up --provision
va ssh
```

## Config VM
### Namings above all
* `host` host of physical machine
* `vm` host of virtual machine
* `docker` host of docker container

### Sync folders from host
Any persistence files which we need should be saved in the host. The VM and dockers can be removed and re-build easily.
* `public`: _directory for file sharing_
* `app` : _directory for source or distribute package_
* `data` : _directory for db data_

## Build images in VM
First of all, we need 3 docker images
0. __linux OS image__ (ubuntu/trusty)
```sh
# official image
docker pull ubuntu/trusty
```
0. __jvm image__ (requires java8)<br>
```sh
# official image
docker pull java:8
```
0. __mongodb image__
  * build our `mongodb` images from `ubuntu/trusty`
```sh
docker build -f Dockerfile_mongodb -t my/mongo:0.1 .
```
It will default run `mongod` service to start mongodb server container after build succeed.
  * pull from existing image
  ``` sh
  docker pull my/mongo:0.1
  ```



## Run App
0. run play container



## Useful command
0. listing
  ```
  # images
  docker images
  docker images -a

  # containers
  docker ps
  docker ps -a
  ```
0. removing
  ```
  docker rm containers
  docker rmi images
  ```

0. inspect containers
  ```
  docker inspect container
  ```


## Other approachs
### Use apt-cacher proxy
```sh
docker build -f Dockerfile_apt-cacher -t oasis/apt-cacher:0.1 .
docker run -d -p 3142:3142 --name test_apt_cacher_ng oasis/apt-cacher:0.1
```

### Build own ubuntu image
```docker build -f Dockerfile_ubuntu -t oasis/ubuntu:0.1 .```

### build own java image
```docker build -f Dockerfile_java -t oasis/jvm:0.1 .
pull java:8
```
### Build and run mongo image
```docker build -f Dockerfile_mongodb -t oasis/mongo:0.1 .
docker run -p 27017:27017 --name mongo -d oasis/mongo:0.1 --noprealloc --smallfiles
```
### Build play image
