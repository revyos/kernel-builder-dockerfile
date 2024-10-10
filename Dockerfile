FROM scratch

LABEL org.opencontainers.image.authors="gaohan@iscas.ac.cn"

ARG arch_name

ADD ${arch_name}.tar.xz /

ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
    apt install -y gdisk dosfstools build-essential \
    libncurses-dev gawk flex bison openssl libssl-dev tree \
    dkms libelf-dev libudev-dev libpci-dev libiberty-dev autoconf device-tree-compiler \
    devscripts pahole bc rsync bash wget cpio sudo python-is-python3 debhelper ccache asciidoc python3-dev

RUN apt install -y nodejs

RUN if [ "$(uname -m)" = "x86_64" ]; \
    then apt install -y \
    g++-10-riscv64-linux-gnu gcc-10-riscv64-linux-gnu \
    g++-11-riscv64-linux-gnu gcc-11-riscv64-linux-gnu \
    g++-12-riscv64-linux-gnu gcc-12-riscv64-linux-gnu \
    g++-13-riscv64-linux-gnu gcc-13-riscv64-linux-gnu \
    g++-riscv64-linux-gnu gcc-riscv64-linux-gnu; \
    elif [ "$(uname -m)" = "riscv64" ]; \
    then apt install -y \
    g++-10 gcc-10 \
    g++-11 gcc-11 \
    g++-12 gcc-12 \
    g++-13 gcc-13 \
    g++ gcc; \
    fi

RUN ln -sf /bin/bash /bin/sh

CMD [ "/bin/bash" ]
