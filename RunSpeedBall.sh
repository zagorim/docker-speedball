#!/bin/bash
sed -i "s/MASTER_LOGIN/$MASTER_LOGIN/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/MASTER_PASSWORD/$MASTER_PASSWORD/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/SERVER_NAME/$SERVER_NAME/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/PLAY_PASSWORD/$PLAY_PASSWORD/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/SPEC_PASSWORD/$SPEC_PASSWORD/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt
sed -i "s/COMMENT/$COMMENT/g" /opt/maniaplanet-server/UserData/Config/dedicated_cfg.txt

exec su -c "/opt/maniaplanet-server/ManiaPlanetServer /Title=SpeedBall@steeffeen /dedicated_cfg=dedicated_cfg.txt /game_settings=MatchSettings/SMStormSpeedBall.txt /nodaemon" shootmania

