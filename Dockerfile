FROM lsiobase/ubuntu:focal AS compile-image

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN apt-get update -yq && \
    apt-get -yq --no-install-recommends install gcc git python3 python3-pip python3-setuptools python3-dev python3-venv && \
    apt-get clean && \
    cd /opt && \
    git clone https://github.com/frillip/noip-rfc2136.git && \
    cd ./noip-rfc2136 && \
    python3 -m venv $VIRTUAL_ENV && \
    python3 -m pip install  --upgrade pip setuptools wheel && \
    python3 -m pip install -r requirements.txt

FROM lsiobase/ubuntu:focal AS build-image

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

COPY --from=compile-image /opt/venv /opt/venv
COPY --from=compile-image /opt/noip-rfc2136/noip-rfc2136.py /opt/venv/
COPY root/ /

RUN apt-get update -yq && \
    apt-get -yq --no-install-recommends install iputils-ping dnsutils python3 python3-venv && \
    apt-get clean

EXPOSE 8000

