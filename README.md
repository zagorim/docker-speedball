# speedball
=================

[docker](https://www.docker.com/) image to run a speedball server in 2min

You just need to specify your maniaplanet dedicated server login, password and the server name before running it like this :

docker run -d -p 2350:2350/udp -p 2350:2350/tcp -p 3450:3450/udp -p 3450:3450/tcp -e 'SERVER_NAME=SERVER NAME' -e 'MASTER_LOGIN=YOURLOGIN' -e 'MASTER_PASSWORD=YOURPASS' zagorim/speedball
