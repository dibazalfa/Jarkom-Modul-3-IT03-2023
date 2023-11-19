echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update
apt-get install isc-dhcp-server -y

interfaces="INTERFACESv4=\"eth0\"
INTERFACESv6=\"\"
"
echo "$interfaces" > /etc/default/isc-dhcp-server

subnet="option domain-name \"example.org\";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style-none;

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
    subnet 10.65.4.0 netmask 255.255.255.0 {
    range 10.65.4.12 10.65.4.20;
    range 10.65.4.160 10.65.4.168;
    option routers 10.65.4.1;
    option broadcast-address 10.65.4.255;
    option domain-name-servers 10.65.1.3;
    default-lease-time 720;
    max-lease-time 5760;
}

host Revolte {
    hardware ethernet 72:b7:93:55:30:f5;
    fixed-address 10.65.3.69;
}
"
echo "$subnet" > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart