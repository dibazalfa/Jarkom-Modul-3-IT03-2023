# Jarkom-Modul-3-IT03-2023

## Kelompok: IT03
### Anggota: 
Nama | NRP | Github 
--- | --- | --- |
Adiba Zalfa Camilla | 5027211060 | https://github.com/dibazalfa
Wiridlangit Suluh Jiwangga | 5027211064 | https://github.com/wiridlangit

### Grimoire
https://its.id/m/IT03_Grimoire

## Daftar isi
- [Topologi](#topologi)
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

# Topologi
![Screenshot 2023-11-15 205506](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/48c822b2-c96c-495d-9928-cc512205338c)


# Konfigurasi
- Aura (DHCP Relay)
```
auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
	address 10.65.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.65.2.1
	netmask 255.255.255.0

auto eth3
iface eth3 inet static
	address 10.65.3.1
	netmask 255.255.255.0

auto eth4
iface eth4 inet static
	address 10.65.4.1
	netmask 255.255.255.0
```
- Heiter (DNS Server)
```
auto eth0
iface eth0 inet static
	address 10.65.1.3
	netmask 255.255.255.0
	gateway 10.65.1.1
```
- Himmel (DHCP Server)
```
auto eth0
iface eth0 inet static
	address 10.65.1.2
	netmask 255.255.255.0
	gateway 10.65.1.1
```
- Eisen (Load Balancer)
```
auto eth0
iface eth0 inet static
	address 10.65.2.3
	netmask 255.255.255.0
	gateway 10.65.2.1
```
- Denken (Databse Server)
```
auto eth0
iface eth0 inet static
	address 10.65.2.2
	netmask 255.255.255.0
	gateway 10.65.2.1
```
- Frieren (Laravel Worker)
```
auto eth0
iface eth0 inet static
	address 10.65.4.4
	netmask 255.255.255.0
	gateway 10.65.4.1
```
- Flamme (Laravel Worker)
```
auto eth0
iface eth0 inet static
	address 10.65.4.5
	netmask 255.255.255.0
	gateway 10.65.4.1
```
- Fern (Laravel Worker)
```
auto eth0
iface eth0 inet static
	address 10.65.4.6
	netmask 255.255.255.0
	gateway 10.65.4.1
```
- Lawine (PHP Worker)
```
auto eth0
iface eth0 inet static
	address 10.65.3.4
	netmask 255.255.255.0
	gateway 10.65.3.1
```
- Linie (PHP Worker)
```
auto eth0
iface eth0 inet static
	address 10.65.3.3
	netmask 255.255.255.0
	gateway 10.65.3.1
```
- Lugner (PHP Worker)
```
auto eth0
iface eth0 inet static
	address 10.65.3.2
	netmask 255.255.255.0
	gateway 10.65.3.1
```
- Revolte (Client Tetap)
```
auto eth0
iface eth0 inet dhcp
hwaddress ether 72:b7:93:55:30:f5
```
- Stark, Sein, Richter (Client)
```
auto eth0
iface eth0 inet dhcp
```

### Install Depedencies
- Aura (DHCP Relay)
```
apt-get update
apt-get install isc-dhcp-relay -y
```
- Heiter (DNS Server)
```
apt-get update
apt-get install bind9 -y
```
- Himmel (DHCP Server)
```
apt-get update
apt-get install isc-dhcp-server -y
```
- Eisen (Load Balancer)
```
apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y
```
- Denken (Databse Server)
```
apt-get update
apt-get install mariadb-server -y
```
- Fern, Flamme, Frieren (Laravel Worker)
```
apt-get update
apt-get install mariadb-client -y
apt-get install lynx -y
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
apt-get install nginx -y
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
apt-get install git -y
git clone https://github.com/martuafernando/laravel-praktikum-jarkom /var/www/laravel-praktikum-jarkom
composer update
composer install
```
- Lugner, Lawine, Linie (PHP Worker)
```
apt-get update
apt-get install nginx -y
apt-get install lynx -y
apt-get install php php-fpm -y
apt-get install wget -y
apt-get install unzip -y

wget -O '/var/www/granz.channel.it03.com' 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download'
```
- Richter, Revolte, Sein, Stark (Client)
```
apt-get update
apt-get install lynx -y
apt-get install htop -y
apt-get install apache2-utils -y
apt-get install jq -y
```

# Nomor 1
Lakukan konfigurasi sesuai dengan peta yang sudah diberikan.


Menetapkan domain record untuk `riegel.canyon.it03.com` ke worker Laravel dan `granz.channel.it03.com` ke worker PHP, dengan kedua domain tersebut mengarah ke alamat IP 10.65.x.1.


Berikut adalah script yang bisa digunakan untuk konfigurasi awal:

### Heiter.sh
```
apt-get update
apt-get install bind9 -y

forward="options {
directory \"/var/cache/bind\";
forwarders {
  	   192.168.122.1;
};

allow-query{any;};
listen-on-v6 { any; };
};
"
echo "$forward" > /etc/bind/named.conf.options

echo "zone \"riegel.canyon.it03.com\" {
	type master;
	file \"/etc/bind/jarkom/riegel.canyon.it03.com\";
};

zone \"granz.channel.it03.com\" {
	type master;
	file \"/etc/bind/jarkom/granz.channel.it03.com\";
};
" > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

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
@       IN    A    10.65.4.6
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
@       IN    A    10.65.3.2
"
echo "$granz" > /etc/bind/jarkom/granz.channel.it03.com

service bind9 restart
```
### Result Nomor 1
![Screenshot 2023-11-20 182002](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/2f270b93-7fcc-4e66-9d26-95def42aecb2)


![Screenshot 2023-11-20 181728](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/09a9a83d-e49e-4f88-9f14-f6927ca40da6)

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
![Screenshot 2023-11-20 182524](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/e63918fe-773c-4cde-bea4-b4a9a596e082)

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
Karena diminta untuk menuliskan grimoire, buatlah analisis hasil testing dengan 200 request dan 10 request/second masing-masing algoritma Load Balancer dengan ketentuan sebagai berikut: 
```
1. Nama Algoritma Load Balancer.
2. Report hasil testing pada Apache Benchmark.
3. Grafik request per second untuk masing masing algoritma.
4. Analisis.
```

Masukan script yang sama dengan no.7 hanya saja jenis algoritma disesuaikan:

#### Round-robin
```
upstream worker {
    server 10.65.3.2;
    server 10.65.3.3;
    server 10.65.3.4;
}
```

#### Generic hash
```
upstream worker {
    hash $request_uri consistent;
    server 10.65.3.2;
    server 10.65.3.3;
    server 10.65.3.4;
}
```

#### Least connection
```
upstream worker {
    least_conn;
    server 10.65.3.2;
    server 10.65.3.3;
    server 10.65.3.4;
}
```

#### IP hash
```
upstream worker {
    ip_hash;
    server 10.65.3.2;
    server 10.65.3.3;
    server 10.65.3.4;
}
```

### Eisen.sh
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
Jika ingin menggunakan algoritma round-robin kosongkan bagian bawah upstream worker. Sedangkan jika ingin menggunakan algortima lainnya bisa disesuaikan.



Jalankan command berikut untuk dianalisis
`ab -n 200 -c 10 http://granz.channel.it03.com/`

### Result Nomor 8

#### Round-robin
![Screenshot 2023-11-19 021009](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/87fc3c0b-3881-42a9-8693-5528e209cda5)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/fff0aac6-3912-435f-b9b1-8c302f4167c0" width="600" height="400">

#### Generic hash
![Screenshot 2023-11-19 021535](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/0ffbd60c-cf6b-4a34-8aad-aa04e1f3f555)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/6789d260-3a98-4cc6-bde0-fdce8b7bb633" width="600" height="400">

#### Least connection
![Screenshot 2023-11-19 022053](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/a2a1106b-28ff-4731-a517-ed62cd907791)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/7e7c4f3f-8bd2-4802-a9a2-a2ec4d397308" width="600" height="400">

#### IP hash
![Screenshot 2023-11-19 022320](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/545facc8-ccc6-4311-8faf-1e49844d9554)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/4f6b91e3-63cd-4d59-b077-e6764de1bc5f" width="600" height="400">

### Grafik
![Screenshot 2023-11-20 185306](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/cbd43e55-17a7-491b-82ca-c4d8ad21e15d)

Least connection memiliki waktu request tercepat.

# Nomor 9
Dengan menggunakan algoritma Round Robin, lakukan testing dengan menggunakan 3 worker, 2 worker, dan 1 worker sebanyak 100 request dengan 10 request/second, kemudian tambahkan grafiknya pada grimoire.

Masukan script yang sama seperti no.7 hanya saja jumlah worker disesuaikan:
#### 3 Worker
```
upstream worker {
    server 10.65.3.2; 
    server 10.65.3.3;
    server 10.65.3.4;
}
```
#### 2 Worker
```
upstream worker {
    server 10.65.3.2; 
    server 10.65.3.3;
}
```
#### 1 Worker
```
upstream worker {
    server 10.65.3.2; 
}
```

### Eisen.sh (3 Worker)
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

### Eisen.sh (2 Worker)
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
    server 10.65.3.2; 
    server 10.65.3.3;
   #server 10.65.3.4;
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

### Eisen.sh (1 Worker)
```
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/lb_php

echo '
    upstream worker {
    server 10.65.3.2; 
   #server 10.65.3.3;
   #server 10.65.3.4;
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
Jika ingin menggunakan 2 Worker hapus worker sehingga jumlah worker sesuai yang diinginkan. Begitu seterusnya.

### Result Nomor 9
#### 3 Worker
![Screenshot 2023-11-19 022652](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/a0e966c9-c67d-4ecb-b08c-d4a5cbc0c89e)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/29458275-3399-48f0-8846-7e2b21c0ddfa" width="600" height="400">

#### 2 Worker
![Screenshot 2023-11-19 022857](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/8b34fdf7-7491-4ccc-8c55-e68b53193cf4)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/a009f57f-99b4-46de-a992-458c26eb8dae" width="600" height="400">

#### 1 Worker
![Screenshot 2023-11-19 022955](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/a65aa29e-754b-4a8c-a34c-686bf5b49124)
<img src="https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/c5d33869-1ee7-4d32-9f88-5dfc8fed7b3e" width="600" height="400">

#### Grafik
![Screenshot 2023-11-20 190141](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/029dda55-43df-495d-b745-9f9f71ba2200)

1 Worker memiliki waktu request terlama.

# Nomor 10
Selanjutnya coba tambahkan konfigurasi autentikasi di LB dengan dengan kombinasi username: “netics” dan password: “ajkyyy”, dengan yyy merupakan kode kelompok. Terakhir simpan file “htpasswd” nya di /etc/nginx/rahasisakita/

Membuat folder rahasisakita dengan `mkdir /etc/nginx/rahasisakita` lalu `htpasswd -c /etc/nginx/rahasisakita/htpasswd netics` untuk membuat kredensial.
```
Username: netics
Password: ajkit03
```

Menambahkan script didalam Eisen.sh
```
auth_basic "Restricted Content";
auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
```

Script keseluruhan akan terlihat seperti:

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

        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasisakita/htpasswd;
    }

ln -sf /etc/nginx/sites-available/lb_php /etc/nginx/sites-enabled/

if [ -f /etc/nginx/sites-enabled/default ]; then
    rm /etc/nginx/sites-enabled/default
fi

service nginx restart
```

Jalankan `lynx http://granz.channel.it03.com/` pada Revolte untuk melihat apakah autentikasi bisa berfungsi.

### Result Nomor 10
![Screenshot 2023-11-20 182755](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/60bda9de-c8c7-43ab-8991-c78ee3d68977)


![Screenshot 2023-11-20 182808](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/2ba9a3da-c9b9-4e51-96c2-79f3c6337afd)

# Nomor 11
Lalu buat untuk setiap request yang mengandung /its akan di proxy passing menuju halaman https://www.its.ac.id. hint: (proxy_pass)

Tambahkan script berikut supaya kita bisa terkoneksi dengan its:


```
location ~ /its {
    proxy_pass https://www.its.ac.id;
    proxy_set_header Host www.its.ac.id;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
}
```

Sehingga script keseluruhan akan terlihat menjadi:

### Eisen.sh
```
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

Jalankan `lynx http://granz.channel.it03.com/its` pada Revolte.

### Result Nomor 11
![Screenshot 2023-11-19 024315](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/ebc0802d-5d6a-40b8-80a4-8e3ac5eab9ac)

# Nomor 12
Selanjutnya LB ini hanya boleh diakses oleh client dengan IP [Prefix IP].3.69, [Prefix IP].3.70, [Prefix IP].4.167, dan [Prefix IP].4.168.

Tambahkan script untuk memberikan akses izin ke IP yang ditentukan:
```
location / {
        allow 10.65.3.69;
        allow 10.65.3.70;
        allow 10.65.3.167;
        allow 10.65.3.168;
        deny all;
    proxy_pass http://worker;
}
```

Lalu tentukan client tetap (client yang memiliki akses). Tambahkan konfigurasi pada dhcp server (Himmel)
```
host Revolte {
    hardware ethernet 72:b7:93:55:30:f5;
    fixed-address 10.65.3.69;
}
```

- `72:b7:93:55:30:f5` didapatkan dari node client (Revolte) dengan menggunakan `ip a` lalu periksa yang terhubung dengan DHCP Relay (Aura) yaitu eth0. Catat ip ethernetnya.
- `10.65.3.69` didapatkan dengan menentukan ip 10.65.3.69 sebagai ip client (Revolte) lalu masukan 10.65.3.69 kedalam network configuration = `/etc/network/interfaces`

### Revolte
### /etc/network/interfaces
```
auto eth0
iface eth0 inet dhcp
hwaddress ether 72:b7:93:55:30:f5
```

Script diatas memodifikasi `/etc/network/interfaces` atau juga dikenal dengan konfigurasi node.

IP Revolte setelah konfigurasi:


![Screenshot 2023-11-19 025207](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/e966b06f-b6c5-4b59-bbac-388ef1ecad9d)

### Revolte.sh
```
apt update
apt install lynx -y
apt install htop -y
apt install apache2-utils -y
apt-get install jq -y

config="auto eth0
iface eth0 inet dhcp
hwaddress ether 72:b7:93:55:30:f5
"
echo "$config" > /etc/network/interfaces
```

Jalankan `lynx http://granz.channel.it03.com/` pada node Revolte! Jika dijalankan pada node lain tidak akan berfungsi karena tidak memiliki izin akses.

### Result Nomor 12

#### Selain Revolte
![Screenshot 2023-11-20 182911](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/dcecd230-02a6-42b8-b0f0-437d32301c93)

#### Revolte
![Screenshot 2023-11-20 183638](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/113527799/af78d7e8-6021-4ba6-82e5-68d4b0043bbc)

# Nomor 13
Semua data yang diperlukan, diatur pada Denken dan harus dapat diakses oleh Frieren, Flamme, dan Fern.

Lakukan konfigurasi Database Server pada DENKEN
```
apt-get install mariadb-server -y
service mysql restart`]
mysql
```
Masukkan command berikut pada mysql
```
CREATE USER 'kelompokit03'@'%' IDENTIFIED BY 'passwordit03';
CREATE USER 'kelompokit03'@'granz.channel.it03.com' IDENTIFIED BY 'passwordit03';
CREATE DATABASE dbkelompokit03;
GRANT ALL PRIVILEGES ON *.* TO 'kelompokit03'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'kelompokit03'@'granz.channel.it03.com';
FLUSH PRIVILEGES;
```

`/etc/mysql/my.cnf`
```
[mysqld]
skip-networking=0
skip-bind-address
```

Lakukan konfigurasi Laravel Worker pada setiap Worker (FERN, FLAMME, FRIEREN)
```
apt-get install mariadb-client -y
```

Untuk memastikan bahwa database pada denken juga dapat diakses melalui laravel worker, gunakan command berikut 
```
mariadb --host=10.65.2.2 --port=3306 --user=kelompokit03 --password
```

### Result Nomor 13
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/541d7eb7-5b94-4b07-9872-a9f6d1bcde0c)

# Nomor 14
Frieren, Flamme, dan Fern memiliki Granz Channel sesuai dengan quest guide berikut https://github.com/martuafernando/laravel-praktikum-jarkom . Jangan lupa melakukan instalasi PHP8.0 dan Composer

Lakukan instalasi berikut pada ketiga Laravel Worker
```
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y
wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
```

git clone github pada dir `/var/www`
```
cd /var/www
```
```
git clone https://github.com/martuafernando/laravel-praktikum-jarkom
composer update
composer install
```

Lakukan konfigurasi pada ketiga Laravel Worker
```
cp /var/www/laravel-praktikum-jarkom/.env.example /var/www/laravel-praktikum-jarkom/.env
```

`.env`
```
DB_CONNECTION=mysql
DB_HOST=10.65.2.2
DB_PORT=3306
DB_DATABASE=dbkelompokit03
DB_USERNAME=kelompokit03
DB_PASSWORD=passwordit03
```
Jalankan command berikut 
```
php artisan migrate:fresh
php artisan db:seed --class=AiringsTableSeeder
php artisan key:generate
php artisan config:cache
php artisan migrate
php artisan db:seed
php artisan storage:link
php artisan jwt:secret
php artisan config:clear
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
```
Database pada Denken akan terisi
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/0bb512f5-aa69-4b64-9863-5b30f59f46ce)

Selanjutnya lakukan deployment pada worker

Pembagian port seperti berikut

Fern : 8001

Flamme : 8002

Frieren : 8003

`/etc/nginx/sites-available/fff`
```
server {

    listen [port];

    root /var/www/laravel-praktikum-jarkom/public;

    index index.php index.html index.htm;
    server_name _;

    location / {
            try_files $uri $uri/ /index.php?$query_string;
    }

    # pass PHP scripts to FastCGI server
    location ~ \.php$ {
    include snippets/fastcgi-php.conf;
    fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }

location ~ /\.ht {
            deny all;
    }

    error_log /var/log/nginx/fff_error.log;
    access_log /var/log/nginx/fff_access.log;
}
```
Kemudian jalankan command berikut 
```
ln -s /etc/nginx/sites-available/fff /etc/nginx/sites-enabled/
chown -R www-data.www-data /var/www/laravel-praktikum-jarkom/storage
service php8.0-fpm start
service nginx restart
```

Lakukan test menggunakan `lynx localhost:[port]` (port menyesuaikan worker)

### Result Nomor 14
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/13f3a5aa-111d-4c4f-9967-fae912a9432c)

# Nomor 15
Riegelcom Channel memiliki beberapa endpoint yang harus ditesting sebanyak 100 request dengan 10 request/second. Tambahkan response dan hasil testing pada grimoire.

POST /auth/register

Buat file `register.json` pada client yang berisi 
```
{
"username" : "kelompokit03",
"password" : "kelompokit03"
}
```

Jalankan testing berikut
```
ab -n 100 -c 10 -p register.json -T application/json http://10.65.4.6:8001/api/auth/register
```

### Result Nomor 15
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/c675fcb4-3b87-47ec-a251-80c2573703da)

# Nomor 16
POST /auth/login

Buat file `login.json` pada client yang berisi 
```
{
"username" : "kelompokit03",
"password" : "kelompokit03"
}
```

Jalankan testing berikut
```
ab -n 100 -c 10 -p login.json -T application/json http://10.65.4.6:8001/api/auth/login
```

### Result Nomor 16
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/1bec8056-04c1-4fd9-a509-2b42310e2f57)

# Nomor 17
GET /me

Jalankan command berikut
```
curl -X POST -H "Content-Type: application/json" -d @login.json http://10.65.4.6:8001/api/auth/login > login_output.txt
token=$(cat login_output.txt | jq -r '.token')
```

Jalankan testing berikut
```
ab -n 100 -c 10 -H "Authorization: Bearer $token" http://10.65.4.6:8001/api/me
```

### Result Nomor 17
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/ea4c526d-4d57-4534-8ebf-11299fa629f3)

# Nomor 18
Lakukan konfigurasi Load Balancer pada EISEN

`/etc/nginx/sites-available/laravel-fff`
```
upstream worker {
    server 10.65.4.6:8001;
    server 10.65.4.5:8002;
    server 10.65.4.4:8003;
}

server {
    listen 80;
    server_name riegel.canyon.it03.com;

    location / {
        proxy_pass http://worker;
    }
}
```
```
ln -s /etc/nginx/sites-available/laravel-fff /etc/nginx/sites-enabled/
```

Pastikan pada Heiter, riegel.canyon.it03.com mengarah pada IP Load Balancer (10.65.2.3)

Lakukan testing menggunakan coommand berikut
```
ab -n 100 -c 10 -p login.json -T application/json http://riegel.canyon.it03.com/api/auth/login
```

### Result Nomor 18
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/c933f39c-d391-471f-b888-993641f7c11f)

Fern
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/b26a3d6a-5479-48ff-81d2-b4a42983625b)

Flamme
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/257b7501-15e1-40c9-95b2-110ea8c42eb1)

Frieren
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/4cbb785e-9a92-4f17-a8e3-b7a931a78a9d)

# Nomor 19
Untuk meningkatkan performa dari Worker, coba implementasikan PHP-FPM pada Frieren, Flamme, dan Fern. Untuk testing kinerja naikkan 
- pm.max_children
- pm.start_servers
- pm.min_spare_servers
- pm.max_spare_servers
sebanyak tiga percobaan dan lakukan testing sebanyak 100 request dengan 10 request/second kemudian berikan hasil analisisnya pada Grimoire.

Dibuat 3 script sebagai berikut 

`testing1.sh`
```
#!/bin/bash

echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 10
pm.start_servers = 5
pm.min_spare_servers = 3
pm.max_spare_servers = 8' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

`testing2.sh`
```
#!/bin/bash

echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 20
pm.start_servers = 8
pm.min_spare_servers = 5
pm.max_spare_servers = 12' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

`testing3.sh`
```
#!/bin/bash

echo '[www]
user = www-data
group = www-data
listen = /run/php/php8.0-fpm.sock
listen.owner = www-data
listen.group = www-data
php_admin_value[disable_functions] = exec,passthru,shell_exec,system
php_admin_flag[allow_url_fopen] = off

; Choose how the process manager will control the number of child processes.

pm = dynamic
pm.max_children = 40
pm.start_servers = 10
pm.min_spare_servers = 8
pm.max_spare_servers = 15' > /etc/php/8.0/fpm/pool.d/www.conf

service php8.0-fpm restart
```

Lakukan testing pada client untuk setiap script 
```
ab -n 100 -c 10 -p login.json -T application/json http://riegel.canyon.it03.com/api/auth/login
```

### Result 
`testing1.sh`
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/cb6438ca-779e-4c09-9824-08b30e53b495)

`testing2.sh`
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/6424499a-bcf6-4e72-b264-fa43b2ffa81a)

`testing3.sh`
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/6a413001-b756-4bd3-92ac-19db5066a5dd)

# Nomor 20
Nampaknya hanya menggunakan PHP-FPM tidak cukup untuk meningkatkan performa dari worker maka implementasikan Least-Conn pada Eisen. Untuk testing kinerja dari worker tersebut dilakukan sebanyak 100 request dengan 10 request/second.

Tambahkan konfigurasi seperti berikut pada EISEN
`/etc/nginx/sites-available/laravel-fff`
```
upstream worker {
    least_conn;
    server 10.65.4.6:8001;
    server 10.65.4.5:8002;
    server 10.65.4.4:8003;
}

server {
    listen 80;
    server_name riegel.canyon.it03.com;

    location / {
        proxy_pass http://worker;
    }
}
```
```
ln -s /etc/nginx/sites-available/laravel-fff /etc/nginx/sites-enabled/
service nginx restart
```

### Result
![image](https://github.com/dibazalfa/Jarkom-Modul-3-IT03-2023/assets/103043684/6831cd2a-0639-470a-a2ca-512c4efef86a)
