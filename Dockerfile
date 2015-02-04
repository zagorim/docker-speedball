FROM		debian:wheezy
MAINTAINER	Zagorim

RUN echo "deb http://static.maniaplanet.com/repository any main" >>  /etc/apt/sources.list
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4A46CD4DD71D8F6F
RUN apt-get update && apt-get install -yq  maniaplanet-server \
curl \
procps
RUN curl -L -o /opt/maniaplanet-server/UserData/Packs/SpeedBall.Title.Pack.Gbx http://files.steeffeen.com/packs/SpeedBall.Title.Pack.Gbx
COPY dedicated_cfg.txt /opt/maniaplanet-server/UserData/Config/
RUN useradd -d /opt/maniaplanet-server/ -s /bin/bash shootmania
#RUN chown -R shootmania:games /opt/maniaplanet-server
COPY RunSpeedBall.sh /opt/maniaplanet-server/
RUN usermod -a -G games shootmania
WORKDIR /opt/maniaplanet-server
CMD ["/opt/maniaplanet-server/RunSpeedBall.sh"]
