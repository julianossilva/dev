FROM ubuntu:22.04

USER root

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get -y install --no-install-recommends \
    wget \
    git \
    curl \
    make \
    tmux \
    cmake \
    gcc \
    g++ \
    ca-certificates

ARG USERNAME=developer
ARG GROUP=developer
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} ${GROUP}
RUN useradd -u ${UID} -g ${GROUP} -s /bin/sh -m ${USERNAME} 


COPY ./scripts/docker/build-neovim.sh build-neovim.sh
RUN sh build-neovim.sh

COPY ./scripts/docker/build-node.sh build-node.sh
RUN sh build-node.sh

USER ${UID}:${GID}

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

WORKDIR /home/${USERNAME}/app
