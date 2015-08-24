#!/bin/bash
cat >/etc/sysconfig/static-routes << EOF
any net 192.168.68.0/24 gw 10.80.1.1
EOF
sed -i '29a\#add non interface-specific-routes.\nif [ -f /etc/sysconfig/static-routes ]; then\n    grep "^any" /etc/sysconfig/static-routes | while read ignore args; do\n    /sbin/route add -$args\n    done\nfi       ' /etc/init.d/network
/etc/init.d/network restart
