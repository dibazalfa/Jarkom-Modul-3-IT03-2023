# Client = Richter, Revolter, Sein, Stark

apt-get update
apt-get install lynx -y
apt-get install htop -y
apt-get install apache2-utils -y
apt-get install jq -y

config="auto eth0
iface eth0 inet dhcp
hwaddress ether 72:b7:93:55:30:f5
"
echo "$config" > /etc/network/interfaces

echo '
{
  "username": "kelompokit03",
  "password": "passwordit03"
}
' > register.json

echo '
{
  "username": "kelompokit03",
  "password": "passwordit03"
}
' > login.json
