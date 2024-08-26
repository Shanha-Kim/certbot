#!/bin/bash

# 기존 tlexi 서비스용 docker중지
bash /home/user1/tlexi/backend/stop_server.sh

# certbot 이용해 letsencrypt 인증서 갱신
bash /home/user1/tlexi/certbot/run_certbot.sh
bash /home/user1/tlexi/certbot/kill_certbot.sh

# 갱신된 인증서로 이전 인증서 덮어쓰기
/usr/bin/mv -f /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/cert3.pem /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/cert2.pem
/usr/bin/mv -f /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/chain3.pem /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/chain2.pem
/usr/bin/mv -f /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/fullchain3.pem /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/fullchain2.pem
/usr/bin/mv -f /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/privkey3.pem /home/user1/tlexi/certbot/certbot/conf/archive/tlexi.com/privkey2.pem

#docker로 받은 인증서 권한변경
chown -R user1:user1 /home/user1/tlexi/certbot

bash /home/user1/tlexi/backend/run_server.sh

nowdate=$(date +"%Y-%m-%d %H:%M:%S")
echo "######################################################"
echo "It is ${nowdate}, letsencrypt renewing is completed."
echo "######################################################"
echo ""