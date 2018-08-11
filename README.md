# Bifrost - docker image
This docker image includes shell script to install a [Bifrost Masternode](http://www.bifrostcoin.io/) on a Linux server running Ubuntu 16.04.  
  
This script will install **Bifrost v1.1**.
***


#__If you haven't already setup your desktop wallet then follow the instuctions [here](https://github.com/rikochet/Bifrost-Docker/blob/master/README-Desktop.md) to get ready!__


## Server Pre-requisites:
Download and install docker.

```
$ apt-get install docker.io
```

## Download & build image:
Grab a copy of the Bifrost-Docker image template from github and build the template as local image.

```
$ git clone https://github.com/rikochet/Bifrost-Docker.git \
&& cd Bifrost-Docker \
&& docker build -t bifrost-masternode .
```

## Configure and run image
Use docker to create a new volume (bifrost-mn1) and run the new image.

- COINKEY is your Master Node Private Key - *[see Desktop Wallet instructions](https://github.com/rikochet/Bifrost-Docker/blob/master/README-Desktop.md)*
- COIN_PORT (default: 9229) is the port used to communicate with the Bifrost network

```
$ docker volume create bifrost-mn1
$ docker run -dit --restart unless-stopped \
--name Bifrost-MN1 \
-v bifrost-mn1:/root/.bifrost \
-p 9229:9229 \
-e COINKEY='ABCDEFGHIJKLMNOPQRTSUVWXYZ0123456789' \
bifrost-masternode:latest

```


## Usage:
Connect to the container with exec

```
$ docker exec -it Bifrost-MN1 bash
```

Some helpful commands for checking up on your master node..

```
$ bifrost-cli getinfo
$ bifrost-cli masternode status
$ bifrost-cli mnsync status
```

***

## Donations:  

Any donation is highly appreciated.  

**Bifrost**: BNtnugNSfifPJCUB7GsMYEATKEwqSeLpy2  
**BTC**: 1J8SDZmePwqf7yw1ccDoywJctvg5qZPBVK  
**ETH**: 0x61a648673b8364CBa3DB5bd91b3bC6B5c7144e87  
**Bcash**: qr8dxswrpqlyz9pwyxh92n6j5djm6g44jq9d6th8jm
