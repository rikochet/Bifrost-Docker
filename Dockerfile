## Base Image
FROM ubuntu:16.04

## Environment Variables
# ENV TMP_FOLDER=$(mktemp -d)
ENV CONFIG_FILE='bifrost.conf'
ENV CONFIGFOLDER='/root/.bifrost'
ENV COIN_DAEMON='/usr/local/bin/bifrostd'
ENV COIN_CLI='/usr/local/bin/bifrost-cli'
ENV COIN_REPO='https://github.com/bifrost-actual/bifrost-coin/releases/download/v1.0.3/bifrost-1.0.3-aarch64-linux-gnu.tar.gz'
ENV COIN_NAME='Bifrost'
ENV COIN_PORT=9229
ENV CONFIG_FILE='bifrost.conf'
ENV CONFIGFOLDER='/root/.bifrost'
ENV COINKEY=""

# ENV NODEIP=$(curl -s4 icanhazip.com)
ENV RED='\033[0;31m'
ENV GREEN='\033[0;32m'
ENV NC='\033[0m'

## Install Dependencies
RUN apt-get upgrade && apt-get update && apt-get install -y \
    software-properties-common
RUN apt-add-repository -y ppa:bitcoin/bitcoin
RUN apt-get update && apt-get install -y \
    build-essential libtool autoconf libssl-dev libboost-dev sudo automake \
    make wget curl unzip ufw git pkg-config net-tools \ 
    libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev \
    libboost-system-dev libboost-test-dev libboost-thread-dev \
    libdb4.8-dev bsdmainutils libdb4.8++-dev libminiupnpc-dev \
    libgmp3-dev libzmq3-dev libevent-dev libdb5.3++

## Download Binaries and copy to system folder
WORKDIR /root
RUN wget -nv -O - $COIN_REPO | tar xvz -C /root
RUN cp /root/bifrost* /usr/local/bin \
    && strip /usr/local/bin/bifrostd /usr/local/bin/bifrost-cli \
    && chmod +x /usr/local/bin/bifrostd && chmod +x /usr/local/bin/bifrost-cli \
    && rm -rf /root/bifrost*

WORKDIR /root
COPY ./bifrost_install.sh ./
RUN chmod +x /root/bifrost_install.sh
CMD [ "bifrost_install.sh" ]
ENTRYPOINT [ "bash" ]