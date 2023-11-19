6. Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3. (6)

6.1. Masukkan code script pada file /root/.bashrc:
Lugner.sh
```
echo nameserver 10.65.1.3 > /etc/resolv.conf

apt-get update
apt-get install nginx -y
apt-get install lynx -y
apt-get install php php-fpm -y
apt-get install wget -y
apt-get install unzip -y
service nginx start
service php7.3-fpm start

wget -O '/var/www/granz.channel.it03.com' 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download'
unzip -o /var/www/granz.channel.it03.com -d /var/www/
rm /var/www/granz.channel.it03.com
mv /var/www/modul-3 /var/www/granz.channel.it03.com

source /root/script.sh

# ISI SCRIPT.SH (tanpa comment)
# cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.it03.com
# ln -s /etc/nginx/sites-available/granz.channel.it03.com /etc/nginx/sites-enabled/
# rm /etc/nginx/sites-enabled/default

# echo 'server {
#     listen 80;
#     server_name _;

#     root /var/www/granz.channel.it03.com;
#     index index.php index.html index.htm;

#     location / {
#         try_files $uri $uri/ /index.php?$query_string;
#     }

#     location ~ \.php$ {
#         include snippets/fastcgi-php.conf;
#         fastcgi_pass unix:/run/php/php7.3-fpm.sock;
#         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
#         include fastcgi_params;
#     }
# }' > /etc/nginx/sites-available/granz.channel.it03.com

# service nginx restart
```

6.2 Gunakan `lynx localhost` untuk periksa apakah konfigurasi web sudah bekerja dengan benar

7. Kepala suku dari Bredt Region memberikan resource server sebagai berikut: Lawine, 4GB, 2vCPU, dan 80 GB SSD. Linie, 2GB, 2vCPU, dan 50 GB SSD. Lugner 1GB, 1vCPU, dan 25 GB SSD. Aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second. (7)

7.1 Domain diarahkan ke Load Balancer yaitu Eisen

Heiter.sh
```
riegel="
;
;BIND data file for local loopback interface
;
\$TTL    604800
@    IN    SOA    riegel.canyon.it03.com. root.riegel.canyon.it03.com. (
        2        ; Serial
                604800        ; Refresh
                86400        ; Retry
                2419200        ; Expire
                604800 )    ; Negative Cache TTL
;
@    IN    NS    riegel.canyon.it03.com.
@       IN    A    10.65.2.3
"
echo "$riegel" > /etc/bind/jarkom/riegel.canyon.it03.com

granz="
;
;BIND data file for local loopback interface
;
\$TTL    604800
@    IN    SOA    granz.channel.it03.com. root.granz.channel.it03.com. (
        2        ; Serial
                604800        ; Refresh
                86400        ; Retry
                2419200        ; Expire
                604800 )    ; Negative Cache TTL
;
@    IN    NS    granz.channel.it03.com.
@       IN    A    10.65.2.3
"
echo "$granz" > /etc/bind/jarkom/granz.channel.it03.com
```

7.2 Konfigurasi nginx pada node Eisen

Eisen.sh
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
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

        proxy_pass http://worker;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

7.3 Buka Revolte dan install depedencies berikut

```
apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y
```

7.4 Pada node Revolte (client) jalankan command berikut:
`ab -n 1000 -c 100 http://granz.channel.it03.com/`

8. Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut: 1. Nama Algoritma Load Balancer; 2. Report hasil testing pada Apache Benchmark; 3.Grafik request per second untuk masing masing algoritma; 4. Analisis

8.1 Masukan script yang sama dengan no.7 hanya saja jenis algoritma disesuaikan

Eisen.sh
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

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

        proxy_pass http://worker;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

8.1 Jalankan command berikut untuk dianalisis
`ab -n 200 -c 10 http://www.granz.channel.a09.com/`

9. Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire. (9)

9.1 Masukan script berikut pada Eisen:


Eisen.sh (3 Woeker)
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
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

        proxy_pass http://worker;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

Eisen.sh (2 Woeker)
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
    server 10.65.3.2; 
    server 10.65.3.3;
#   server 10.65.3.4;
}

server {
    listen 80;
    server_name granz.channel.it03.com www.granz.channel.it03.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

        location / {

        proxy_pass http://worker;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

Eisen.sh (1 Woeker)
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
    server 10.65.3.2; 
#   server 10.65.3.3;
#   server 10.65.3.4;
}

server {
    listen 80;
    server_name granz.channel.it03.com www.granz.channel.it03.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

        location / {

        proxy_pass http://worker;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

10. Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/

10.1 Membuat folder rahasisakita dengan `mkdir /etc/nginx/rahasisakita` lalu `htpasswd -c /etc/nginx/rahasisakita/htpasswd netics` untuk membuat kredensial.

Username: netics
Password: ajkit03

10.2 Menambahkan script 
```
auth_basic "Restricted Content";
auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
```

10.3 Script keseluruhan akan terlihat seperti:
Eisen.sh
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
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

        proxy_pass http://worker;

        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

10.4 Jalankan `lynx http://granz.channel.it03.com/` pada Revolte untuk melihat apakah autentikasi bisa berfungsi.

11. Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. (11) hint: (proxy_pass)

11.1 Tambahkan script berikut:
Eisen.sh
```
location ~ /its {
    proxy_pass https://www.its.ac.id;
    proxy_set_header Host www.its.ac.id;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

11.2 Sehingga script keseluruhan akan terlihat menjadi:
Eisen.sh
```
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

        proxy_pass http://worker;

#       auth_basic "Restricted Content";
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
```

11.3 Jalankan `lynx http://granz.channel.it03.com/its` pada Revolte untuk periksa apakah sudah berhasil

12. Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168.

12.1 Tambahkan script untuk memberikan akses izin ke IP yang ditentukan:
```
location / {
        allow 10.65.3.69;
        allow 10.65.3.70;
        allow 10.65.3.167;
        allow 10.65.3.168;
        deny all;
    proxy_pass http://worker;
}```

12.2 Lalu tentukan client tetap (client yang memiliki akses). Tambahkan konfigurasi pada dhcp server (Himmel)
```
host Revolte {
    hardware ethernet 72:b7:93:55:30:f5;
    fixed-address 10.65.3.69;
}
```

72:b7:93:55:30:f5 didapatkan dari node client (Revolte) dengan menggunakan `ip a` lalu periksa yang terhubung dengan DHCP Relay (Aura) yaitu eth0. Catat ip ethernetnya.
10.65.3.69 didapatkan dengan menentukan ip 10.65.3.69 sebagai ip client (Revolte) lalu masukan 10.65.3.69 kedalam network configuration = `/etc/network/interfaces`

Revolte.sh
```
config="auto eth0
iface eth0 inet dhcp
hwaddress ether 72:b7:93:55:30:f5
"
echo "$config" > /etc/network/interfaces
```

12.3 Jalankan `lynx http://granz.channel.it03.com/` pada node Revolte! Jika dijalankan pada node lain tidak akan berfungsi karena tidak memiliki izin akses.