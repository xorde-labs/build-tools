FROM ubuntu:18.04
MAINTAINER Xander Tovski <xt@xorde.co>

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV QT_VERSION=5.15
ENV QT_SOURCE_DIR=qt5

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -y install \
      git wget build-essential software-properties-common xvfb flex dh-make debhelper checkinstall fuse bison

RUN apt-get -y install \
    libxcursor-dev libxcomposite-dev libssl-dev libxcb1-dev libx11-dev libgl1-mesa-dev libudev-dev

COPY scripts/sources.sh .

RUN ./sources.sh

RUN apt-get install -y libclang-dev

COPY scripts/make.sh .

RUN ./make.sh
