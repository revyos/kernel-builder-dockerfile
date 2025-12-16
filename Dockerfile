ARG debian_version

FROM debian:${debian_version}

LABEL org.opencontainers.image.authors="gaohan@iscas.ac.cn"

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y gdisk dosfstools build-essential \
    libncurses-dev gawk flex bison openssl libssl-dev tree \
    dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf device-tree-compiler \
    devscripts pahole bc rsync bash wget cpio sudo python-is-python3 debhelper ccache asciidoc python3-dev \
    libdw-dev zstd rustc rust-src bindgen rustfmt rust-clippy

RUN apt install -y nodejs

RUN if [ "$(uname -m)" = "x86_64" ]; \
    then apt install -y \
    g++-riscv64-linux-gnu gcc-riscv64-linux-gnu; \
    elif [ "$(uname -m)" = "riscv64" ]; \
    then apt install -y \
    g++ gcc; \
    fi

RUN ln -sf /bin/bash /bin/sh

CMD [ "/bin/bash" ]
