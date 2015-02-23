FROM            debian:wheezy
MAINTAINER      Zagorim

RUN \

        apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4A46CD4DD71D8F6F && \
        echo "deb http://static.maniaplanet.com/repository any main" >  /etc/apt/sources.list.d/maniaplanet.list && \
        apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
        echo "deb http://ftp.igh.cnrs.fr/pub/mariadb/repo/10.0/debian wheezy main" > /etc/apt/sources.list.d/mariadb.list 
RUN apt-get update && \
        DEBIAN_FRONTEND=noninteractive apt-get install -yq maniaplanet-server \
        python-software-properties \
        mariadb-server \
        curl \
        git \
	php5-cli \
	php5-curl \
        procps \
	pwgen
RUN     rm -rf /var/lib/apt/lists/* && \
        sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
        echo "mysqld_safe &" > /tmp/config && \
        echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
        echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
        bash /tmp/config && \
        rm -f /tmp/config
RUN useradd -d /opt/maniaplanet-server/ -s /bin/bash shootmania
RUN curl -L -o /opt/maniaplanet-server/UserData/Packs/SpeedBall.Title.Pack.Gbx http://files.steeffeen.com/packs/SpeedBall.Title.Pack.Gbx
RUN cd /opt && git clone https://github.com/ManiaControl/ManiaControl.git && chown -R shootmania:games /opt/ManiaControl && chmod -R +x /opt/ManiaControl
COPY dedicated_cfg.txt /opt/maniaplanet-server/UserData/Config/
COPY RunSpeedBall.sh /opt/maniaplanet-server/
RUN usermod -a -G games shootmania
WORKDIR /opt/maniaplanet-server
CMD ["/opt/maniaplanet-server/RunSpeedBall.sh"]

