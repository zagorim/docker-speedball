# docker-Speedball

Run a shootmania speedball server super easily with [docker](https://www.docker.com/)


Now with maniacontrol !

[What is docker](https://www.docker.com/whatisdocker/) 

[How to install it](https://docs.docker.com/installation/debian/)

Create your dedicated server logins [here](https://v4.live.maniaplanet.com/account/dedicated-servers)
You just need to specify your maniaplanet dedicated server login, password, the server name and the admin login before running it like this :

```
docker run --name myspeedball -d -p 2350:2350/udp -p 2350:2350/tcp -p 3450:3450/udp
-p 3450:3450/tcp -e 'SERVER_NAME=server_name' -e 'MASTER_LOGIN=dedicated_login' 
-e 'MASTER_PASSWORD=dedicated_password' -e 'ADMIN_LOGIN=shootmania_login' zagorim/speedball
```

## Enter the container

    docker exec -t -i myspeedball bash

## All configuration options   
All the environment variables ( -e ) you can/need to modify

```
MASTER_LOGIN        Required
MASTER_PASSWORD     Required
ADMIN_LOGIN         Required
SERVER_NAME         Required
PLAY_PASSWORD       Optional
SPEC_PASSWORD       Optional
COMMENT             Optional
MYSQL_PASS          Randomly generated if not specified by user
RPC_PASS            Randomly generated if not specified by user
SERVER_PORT         2350 if not specified by user
SERVER_P2P_PORT     3450 if not specified by user
```




