FROM arm32v6/alpine:latest

RUN set -xe \
    && apk update \
    && apk add build-base \
               gcc \
               abuild \
               binutils \
               binutils-doc \
               gcc-doc \
               git \
               libev-dev \
               automake \
               autoconf \
               libtool \
               argp-standalone \
               linux-headers \
               libusb-dev \
               cmake \
               cmake-doc \
               dev86 \
     && git clone https://github.com/knxd/knxd.git \
     && cd knxd \
     && ./bootstrap.sh \
     && ./configure --disable-systemd --enable-eibnetip --enable-eibnetserver --enable-eibnetiptunnel \
     && mkdir -p src/include/sys && ln -s /usr/lib/bcc/include/sys/cdefs.h src/include/sys \
     && make \
     && make install

EXPOSE 3672 6720

VOLUME /etc/knxd

CMD ["knxd","/etc/knxd/knxd.ini"]
