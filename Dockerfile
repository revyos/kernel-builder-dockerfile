FROM scratch

LABEL org.opencontainers.image.authors="gaohan@iscas.ac.cn"

ARG arch_name

ADD ${arch_name}.tar.xz /

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y gdisk dosfstools build-essential \
                                  libncurses-dev gawk flex bison openssl libssl-dev tree \
                                  dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf device-tree-compiler \
                                  devscripts pahole bc rsync bash wget cpio sudo python-is-python3 debhelper ccache

RUN apt install -y nodejs

RUN ln -sf /bin/bash /bin/sh

CMD [ "/bin/bash" ]
