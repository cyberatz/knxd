<a href="https://travis-ci.com/github/cyberatz/knxd">![Build Status](https://travis-ci.com/cyberatz/knxd.svg?branch=amd64)

# knxd
alpine-knxd docker container for amd64.

See main app by Spanghf37: https://github.com/spanghf37/knx-control.

# Example docker-compose.yml
```
version: '3'
services:  
  knxd:
     image: andrevs/knxd:amd64
     container_name: knxd
     privileged: true
     ports:
       - "3672:3672/udp"
       - "6720:6720/tcp"
     network_mode: "host"
     restart: always
     volumes:
       - </share/knxd>:/etc/knxd
     healthcheck:
      test: "/home/docker-healthcheck"
      interval: 10s
      retries: 100
```

# Example /etc/knxd/knxd.ini
```
[B.unix]
path = /tmp/eib
server = knxd_unix
systemd-ignore = false
[C.ipt]
#driver = ip
driver = ipt
ip-address = 10.0.0.10
[debug-server]
name = mcast:knxd
[tcp]
port=6720
server=knxd_tcp
[main]
addr = 1.1.180
cache = A.cache
client-addrs = 1.1.182:200
connections = server,B.unix,C.ipt,tcp
[server]
debug = debug-server
discover = true
server = ets_router
tunnel = tunnel
```
 
