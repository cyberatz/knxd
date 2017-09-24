https://travis-ci.org/spanghf37/knxd.svg?branch=master

# knxd
alpine-knxd docker container for raspberry-pi

# 1. Configuration files

Copy and edit ```knxd.ini``` to ```/home/pirate/docker/knxd``` on the Raspberry Pi.

# 2. docker run command

```
docker run -p 3672:3672 -p 6720:6720 --net=host -v /home/pirate/docker/knxd/:/etc/knxd/ knxd
```
