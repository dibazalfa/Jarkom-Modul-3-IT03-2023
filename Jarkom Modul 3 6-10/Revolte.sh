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