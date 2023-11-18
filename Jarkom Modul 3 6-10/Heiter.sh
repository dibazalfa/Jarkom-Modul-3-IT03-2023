echo nameserver 192.168.122.1 > /etc/resolv.conf

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

service bind9 restart