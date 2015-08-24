#!/bin/sh
# vim: ts=4:sw=4
#
# set new hostname
hostname="dev115"
domain=".dev.cn"
# set new ip address
local_ip="10.80.1.115"
local_netmask="255.255.255.0"
local_gateway="10.80.1.1"
hostname $hostname$domain

# set hostname
sed -i s/HOSTNAME=.*/HOSTNAME=$hostname$domain/g /etc/sysconfig/network

# delete old hostname
sed -i /\$hostname/d /etc/hosts
sed -i /$hostname/d /etc/hosts
# add new hostname
cat >> /etc/hosts << EOF
$local_ip    $hostname$domain  $hostname
EOF

# add dns
cat > /etc/resolv.conf << "EOF"
# nameserver    8.8.8.8
# nameserver    8.8.4.4
# search        dev.cn
EOF

# configure network
cat > /etc/sysconfig/network-scripts/ifcfg-eth0 << EOF
DEVICE="eth0"
BOOTPROTO="static"
NM_CONTROLLED="yes"
ONBOOT="yes"
TYPE="Ethernet"
IPADDR=$local_ip
NETMASK=$local_netmask
GATEWAY=$local_gateway
EOF

# restart network
service network restart
