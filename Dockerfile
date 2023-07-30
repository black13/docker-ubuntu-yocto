# Use Ubuntu as the base image
FROM ubuntu:20.04

# Do not ask for user input when installing packages
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install necessary packages
RUN apt-get update && apt-get install -y \
    gawk \
    wget \
    git-core \
    diffstat \
    unzip \
    texinfo \
    gcc-multilib \
    build-essential \
    chrpath \
    socat \
    cpio \
    python3 \
    python3-pip \
    python3-pexpect \
    xz-utils \
    debianutils \
    iputils-ping \
    python3-git \
    python3-jinja2 \
    libegl1-mesa \
    libsdl1.2-dev \
    pylint3 \
    xterm \
    python3-subunit \
    mesa-common-dev \
    git

# Create a working directory
WORKDIR /workdir

RUN apt-get clean && apt-get update && apt-get install -y locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  


RUN groupadd -g 1000 yocto && \
    useradd -u 1000 -g yocto -ms /bin/bash yocto && \
    mkdir -p /workdir && \
    chown -R yocto:yocto /workdir

USER yocto
WORKDIR /workdir

CMD ["/bin/bash"]