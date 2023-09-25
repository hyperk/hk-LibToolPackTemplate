FROM ghcr.io/hyperk/hk-DataModel:main

COPY . /usr/local/hk/hk-LibToolPackTemplate

RUN --mount=type=ssh mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

WORKDIR /usr/local/hk
RUN --mount=type=ssh . /usr/local/hk/hk-pilot/setup.sh &&\
    hkp install -r -e hk-LibToolPackTemplate
