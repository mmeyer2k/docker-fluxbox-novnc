FROM ubuntu:20.04

ENV DISPLAY :0
ENV VNC_RESOLUTION 1920x1080
ENV DEBIAN_FRONTEND noninteractive

RUN apt update \
 && apt install -y htop novnc fluxbox x11vnc xterm xvfb supervisor \
 && apt clean \
 && touch /root/.Xauthority \
 && ln -svf /usr/share/novnc/vnc.html /usr/share/novnc/index.html \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD entrypoint.sh /var/entrypoint.sh
ENTRYPOINT /var/entrypoint.sh

ADD etc/supervisor/conf.d/desktop.conf /etc/supervisor/conf.d/desktop.conf
ADD etc/supervisor/conf.d/xterm.conf /etc/supervisor/conf.d/xterm.conf

EXPOSE 5900
EXPOSE 6900
