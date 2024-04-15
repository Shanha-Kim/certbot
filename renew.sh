docker run --rm --name certbot \
 -v '/home/user1/tlexi/certbot/certbot/conf:/etc/letsencrypt' \
 -v '/home/user1/tlexi/certbot/certbot/logs:/var/log/letsencrypt' \
 -v '/home/user1/tlexi/certbot/certbot/data:/var/www/certbot' \
 certbot/certbot renew --server https://acme-v02.api.letsencrypt.org/directory --cert-name tlexi.com

docker run  -it --rm --name certbot \
 -v '/home/user1/tlexi/certbot/certbot/conf:/etc/letsencrypt' \
 -v '/home/user1/tlexi/certbot/certbot/logs:/var/log/letsencrypt' \
 -v '/home/user1/tlexi/certbot/certbot/data:/var/www/certbot' \
 certbot/certbot certificates

  bash run_server.sh

#   crontab save : 0 19 1 * * /home/user1/tlexi/backend/ssl_renew.sh >> /home/user1/tlexi/backend/log/ssl_renew.log