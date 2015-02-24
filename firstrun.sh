#!/bin/bash

if [ -f /alreadyrun ]
then 
	exit 0
fi
touch /alreadyrun
MYSQL_PASS=${MYSQL_PASS:-$(pwgen -s -1 16)}
RPC_PASS=${RPC_PASS:-$(pwgen -s -1 16)}

sed -i "s/MASTER_LOGIN/$MASTER_LOGIN/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/MASTER_PASSWORD/$MASTER_PASSWORD/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/SERVER_NAME/$SERVER_NAME/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/PLAY_PASSWORD/$PLAY_PASSWORD/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/SPEC_PASSWORD/$SPEC_PASSWORD/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/RPC_PASS/$RPC_PASS/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/COMMENT/$COMMENT/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt

cp /opt/ManiaControl/configs/server.default.xml /opt/ManiaControl/configs/server.xml
sed -i "s/mysql_user/root/g" /opt/ManiaControl/configs/server.xml
sed -i "s/mysql_password/$MYSQL_PASS/g" /opt/ManiaControl/configs/server.xml
sed -i "s/password/$RPC_PASS/g" /opt/ManiaControl/configs/server.xml
sed -i "s/database_name/speedball/g" /opt/ManiaControl/configs/server.xml
sed -i "s/>port</>5000</g" /opt/ManiaControl/configs/server.xml
sed -i "s/admin_login/$ADMIN_LOGIN/g" /opt/ManiaControl/configs/server.xml

until pgrep -f "mysqld_safe" 2>&1 >/dev/null; do
        sleep 5
	echo "waiting for the database to start"
done
sleep 5
mysql -e  "CREATE DATABASE speedball; UPDATE mysql.user SET Password=PASSWORD('$MYSQL_PASS') WHERE User='root'; FLUSH PRIVILEGES;"

