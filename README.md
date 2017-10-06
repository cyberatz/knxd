![Build Status](https://travis-ci.org/spanghf37/knxd.svg?branch=master)

# knxd
alpine-knxd docker container for raspberry-pi 64bits

# 1. Configuration files

Copy and edit ```knxd.ini``` to ```/home/docker/knxd``` on the Raspberry Pi.

# 2. docker run command

```
docker run --restart=always -p 3672:3672 -p 6720:6720 --net=host -v /home/docker/knxd/:/etc/knxd/ spanghf37/knxd:latest
```
