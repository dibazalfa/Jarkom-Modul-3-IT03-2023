# Jarkom-Modul-3-IT03-2023

## Kelompok: IT03
### Anggota: 
Nama | NRP | Github 
--- | --- | --- |
Adiba Zalfa Camilla | 5027211060 | https://github.com/dibazalfa
Wiridlangit Suluh Jiwangga | 5027211064 | https://github.com/wiridlangit

## Daftar isi
- [Konfigurasi](#konfigurasi)
- [Nomor 1](#nomor-1)
- [Nomor 2](#nomor-2)
- [Nomor 3](#nomor-3)
- [Nomor 4](#nomor-4)
- [Nomor 5](#nomor-5)
- [Nomor 6](#nomor-6)
- [Nomor 7](#nomor-7)
- [Nomor 8](#nomor-8)
- [Nomor 9](#nomor-9)
- [Nomor 10](#nomor-10)
- [Nomor 11](#nomor-11)
- [Nomor 12](#nomor-12)
- [Nomor 13](#nomor-13)
- [Nomor 14](#nomor-14)
- [Nomor 15](#nomor-15)
- [Nomor 16](#nomor-16)
- [Nomor 17](#nomor-17)
- [Nomor 18](#nomor-18)
- [Nomor 19](#nomor-19)
- [Nomor 20](#nomor-20)

# Konfigurasi

# Nomor 1
Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.

# Nomor 2
Semua CLIENT harus menggunakan konfigurasi dari DHCP Server. Client yang melalui Switch3 mendapatkan range IP dari [prefix IP].3.16 - [prefix IP].3.32 dan [prefix IP].3.64 - [prefix IP].3.80

Pertama-tama, lakukan setup DHCP Relay terlebih dahulu pada AURA.

`/etc/default/isc-dhcp-relay`
```
SERVERS="10.65.1.2" #IP Himmel (DNS Server)
INTERFACES="eth1 eth3 eth4"
OPTIONS=
```
Lalu `echo net.ipv4.ip_forward=1 > /etc/sysctl.conf`

Terakhir, jangan lupa untuk melakukan restart `service isc-dhcp-relay restart`

Kemudian, lakukan konfigurasi DHCP Server pada HIMMEL (untuk nomor 2)

`echo INTERFACESv4="eth0" > /etc/default/isc-dhcp-server`

`/etc/dhcp/dhcpd.conf`
```
subnet 10.65.1.0 netmask 255.255.255.0 {}

subnet 10.65.3.0 netmask 255.255.255.0 {
    range 10.65.3.16 10.65.3.32;
    range 10.65.3.64 10.65.3.80;
    option routers 10.65.3.1;
}

subnet 10.65.4.0 netmask 255.255.255.0 {
}
```

# Nomor 3
Client yang melalui Switch4 mendapatkan range IP dari [prefix IP].4.12 - [prefix IP].4.20 dan [prefix IP].4.160 - [prefix IP].4.168

Tambahkan konfigurasi DHCP Server pada HIMMEL 

`/etc/dhcp/dhcpd.conf`
```
subnet 10.65.1.0 netmask 255.255.255.0 {}

subnet 10.65.3.0 netmask 255.255.255.0 {
    range 10.65.3.16 10.65.3.32;
    range 10.65.3.64 10.65.3.80;
    option routers 10.65.3.1;
}

subnet 10.65.4.0 netmask 255.255.255.0 {
    range 10.65.4.12 10.65.4.20;
    range 10.65.4.160 10.65.4.168;
    option routers 10.65.4.1;
}
```

# Nomor 4
Client mendapatkan DNS dari Heiter dan dapat terhubung dengan internet melalui DNS tersebut

Ubah konfigurasi DHCP Server pada HIMMEL agar mengarah ke IP DNS (10.65.1.3)

`/etc/dhcp/dhcpd.conf`
```
subnet 10.65.1.0 netmask 255.255.255.0 {}

subnet 10.65.3.0 netmask 255.255.255.0 {
    range 10.65.3.16 10.65.3.32;
    range 10.65.3.64 10.65.3.80;
    option routers 10.65.3.1;
    option broadcast-address 10.65.3.255;
    option domain-name-servers 10.65.1.3;
}

subnet 10.65.4.0 netmask 255.255.255.0 {
    range 10.65.4.12 10.65.4.20;
    range 10.65.4.160 10.65.4.168;
    option routers 10.65.4.1;
    option broadcast-address 10.65.4.255;
    option domain-name-servers 10.65.1.3;
}
```

Lakukan konfigurasi DNS Server pada HEITER

`/etc/bind/named.conf.options`
```
nano /etc/bind/named.conf.options
forwarders {
  192.168.122.1;
}
allow-query{any;};
listen-on-v6 { any; };
```
Uji coba ping google.com di client, jika berhasil maka sudah terhubung

# Nomor 5
Lama waktu DHCP server meminjamkan alamat IP kepada Client yang melalui Switch3 selama 3 menit sedangkan pada client yang melalui Switch4 selama 12 menit. Dengan waktu maksimal dialokasikan untuk peminjaman alamat IP selama 96 menit

Tambahkan konfigurasi DHCP Server pada HIMMEL seperti berikut

`/etc/dhcp/dhcpd.conf`
```
subnet 10.65.1.0 netmask 255.255.255.0 {}

subnet 10.65.3.0 netmask 255.255.255.0 {
    range 10.65.3.16 10.65.3.32;
    range 10.65.3.64 10.65.3.80;
    option routers 10.65.3.1;
    option broadcast-address 10.65.3.255;
    option domain-name-servers 10.65.1.3;
    default-lease-time 180;
    max-lease-time 5760;
}

subnet 10.65.4.0 netmask 255.255.255.0 {
    range 10.65.4.12 10.65.4.20;
    range 10.65.4.160 10.65.4.168;
    option routers 10.65.4.1;
    option broadcast-address 10.65.4.255;
    option domain-name-servers 10.65.1.3;
    default-lease-time 720;
    max-lease-time 5760;
}
```
### Result Nomor 1 - 5 
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/39471c2e-405a-4806-b5d0-a5416f4490e0)

Sein merupakan Client yang memiliki IP Dynamic. IP yang didapat adalah 10.65.4.14 dengan lease time 720, ini sudah sesuai dengan konfigurasi yang diberikan. Client mengarah pada DNS Server dan sudah terhubung dengan internet.

# Nomor 6
Pada masing-masing worker PHP, lakukan konfigurasi virtual host untuk website berikut dengan menggunakan php 7.3.

Masukkan code script pada file /root/.bashrc:
### Lugner.sh 
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
```

### /root/script.sh
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.it03.com
ln -s /etc/nginx/sites-available/granz.channel.it03.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

echo 'server {
     listen 80;
     server_name _;

     root /var/www/granz.channel.it03.com;
     index index.php index.html index.htm;

     location / {
         try_files $uri $uri/ /index.php?$query_string;
     }

     location ~ \.php$ {
         include snippets/fastcgi-php.conf;
         fastcgi_pass unix:/run/php/php7.3-fpm.sock;
         fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
         include fastcgi_params;
     }
 }' > /etc/nginx/sites-available/granz.channel.it03.com

 service nginx restart
```

Gunakan `lynx localhost` untuk periksa apakah konfigurasi web sudah bekerja dengan benar.

### Result Nomor 6
<foto>

# Nomor 7
Kepala suku dari Bredt Region memberikan resource server sebagai berikut: Lawine, 4GB, 2vCPU, dan 80 GB SSD. Linie, 2GB, 2vCPU, dan 50 GB SSD. Lugner 1GB, 1vCPU, dan 25 GB SSD. Aturlah agar Eisen dapat bekerja dengan maksimal, lalu lakukan testing dengan 1000 request dan 100 request/second.

Domain pada DNS Server diarahkan ke Load Balancer Eisen seperti sebagai berikut:

### Heiter.sh
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

`@       IN    A    10.65.2.3` disini IP diarahkan ke node Load Balancer Eisen

Konfigurasi /root/.bashrc untuk nginx pada node Eisen sebagai berikut:

### Eisen.sh
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

Buka Node Revolte (client) dan install depedencies berikut

```
apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y
```

Pada node Revolte (client) jalankan command berikut:
`ab -n 1000 -c 100 http://granz.channel.it03.com/`

### Result Nomor 7
![Screenshot 2023-11-19 020538](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/e948ff02-6d31-42af-b50f-b325bf5b1a00)


# Nomor 8

# Nomor 9

# Nomor 10

# Nomor 11

# Nomor 12

# Nomor 13

# Nomor 14

# Nomor 15

# Nomor 16

# Nomor 17

# Nomor 18

# Nomor 19

# Nomor 20
