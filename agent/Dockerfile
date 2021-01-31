# docker 工具箱

FROM ubuntu:20.04

RUN apt update
RUN apt install -y vim \
                    git \
                    fish \
                    curl \
                    wget \
                    nmap \
                    iproute2 \
                    iputils-ping \
                    openssh-client

ENV LANG="en_US.UTF-8"
ENV LC_ALL="C.UTF-8"
ADD vimrc ~/.vimrc

RUN git config --global user.name admin
RUN git config --global user.email 123123@qq.com

WORKDIR /root
ENTRYPOINT [ "fish" ]
