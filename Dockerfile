FROM ubuntu:16.04

RUN apt-get update && apt-get clean && apt-get install -y \
    x11vnc \
    xvfb \
    fluxbox \
    wmctrl \
    curl \
    && apt-get update && apt-get -y install firefox python3-tk python3-dev git \
    && curl -O https://bootstrap.pypa.io/pip/3.4/get-pip.py

    


RUN useradd apps \
    && mkdir -p /home/apps \
    && chown -v -R apps:apps /home/apps

RUN git clone https://github.com/rhuantac/bombcrypto-bot
RUN python3 get-pip.py
RUN pip3 install --upgrade pip
RUN pip3 install python-xlib


WORKDIR /bombcrypto-bot
RUN pip3 install -r requirements.txt

COPY bootstrap.sh /

CMD '/bootstrap.sh'
