echo 'nameserver 10.65.1.3' > /etc/resolv.conf

apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y

service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

mkdir /etc/nginx/rahasisakita

echo '
    upstream worker { #(round-robin(default), least_conn, ip_hash, hash $request_uri consistent)
#    hash $request_uri consistent;
#    least_conn;
#    ip_hash;
    server 10.65.3.2;
    server 10.65.3.3;
    server 10.65.3.4;
}

server {
    listen 80;
    server_name granz.channel.it03.com www.granz.channel.it03.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

        location / {
        allow 10.65.3.69;
        allow 10.65.3.70;
        allow 10.65.3.167;
        allow 10.65.3.168;
        deny all;
        proxy_pass http://worker;

#        auth_basic "Restricted Content";
 #       auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
    }
location ~ /its {
    proxy_pass https://www.its.ac.id;
    proxy_set_header Host www.its.ac.id;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
} ' > /etc/nginx/sites-available/lb_php

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/
#rm /etc/nginx/sites-enabled/default

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart

htpasswd -c /etc/nginx/rahasisakita/htpasswd netics