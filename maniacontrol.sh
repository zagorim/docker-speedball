#!/bin/bash

until pgrep -f "ManiaPlanetServer" 2>&1 >/dev/null; do
        sleep 5
	echo "waiting for the shootmania server to start"
done
sleep 20
cd /opt/ManiaControl
su -c "/opt/ManiaControl/ManiaControl.sh" shootmania
sed -i "s/SMStormSpeedBall.txt/tracklist.txt/g" /opt/speedball.sh

while pgrep -f "php" 2>&1 >/dev/null; do
	sleep 10;
done
exit 1
