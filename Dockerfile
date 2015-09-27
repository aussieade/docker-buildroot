FROM ubuntu-debootstrap

MAINTAINER aussieade

ENV DEBIAN_FRONTEND noninteractive

# setup apt, install software
RUN apt-get update -q && apt-get install -qy \
    bc \
    build-essential \
    bzip2 \
    git \
    libncurses5-dev \
    python \
    rsync \
    unzip \
    vim \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mkdir /buildroot

VOLUME /buildroot

CMD ["/bin/bash"]
