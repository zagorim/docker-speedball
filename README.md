# speedball
=================

[docker](https://www.docker.com/) image to run a speedball server in 2min (if you don't count the download time :D) 

if you don't know [what docker is](https://www.docker.com/whatisdocker/) and how to [install it](https://docs.docker.com/installation/debian/)

You just need to specify your maniaplanet dedicated server login, password and the server name before running it like this :

    docker run --name myspeedball -d -p 2350:2350/udp -p 2350:2350/tcp -p 3450:3450/udp -p 3450:3450/tcp -e 'SERVER_NAME=SERVER NAME' -e 'MASTER_LOGIN=YOURLOGIN' -e 'MASTER_PASSWORD=YOURPASS' zagorim/speedball

if you need to modify something inside the container you can enter it with 

    docker exec -t -i myspeedball bash

maniacontrol will come later
