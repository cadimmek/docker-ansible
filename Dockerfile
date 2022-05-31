FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
                            gcc \
                            libkrb5-dev \
                            krb5-user \
                            python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip  \
    && pip3 install --upgrade virtualenv \
    && pip3 install pywinrm  \
    && pip3 install ansible


RUN ansible-galaxy collection install community.general


CMD ["ansible", "--version"]
