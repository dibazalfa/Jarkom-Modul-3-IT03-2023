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
- [Nomor 4](#nomor-4-subdomain)
- [Nomor 5](#nomor-5-reverse-dns)
- [Nomor 6](#nomor-6-dns-slave)
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

# Nomor 6

# Nomor 7

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
