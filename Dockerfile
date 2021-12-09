FROM lsiobase/ubuntu:bionic

RUN apt-get update -yq && \
    apt-get -yq --no-install-recommends install git iputils-ping dnsutils python3 python3-pip python3-setuptools && \
    python3 -m pip install  --upgrade pip && \
    apt-get clean && \
    cd /opt && \
    git clone https://github.com/marrold/noip-rfc2136.git && \
    cd ./noip-rfc2136 && \
    python3 -m pip install -r requirements.txt

COPY root/ /

EXPOSE 8000

