#!/bin/sh
# vim: ts=4:sw=4
#local network yum server

mirrors_server=mirrors.dev.cn
mirrors_server_ip=10.80.1.20
sed -i /$mirrors_server/d /etc/hosts
echo "$mirrors_server_ip    $mirrors_server mirrors" >> /etc/hosts

cat <<EOF > /etc/yum.repos.d/CentOS-Base.repo
[base]
name=CentOS-\$releasever - Base
baseurl=http://$mirrors_server/centos/\$releasever/os/\$basearch/
enabled=1
priority=10
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

#released updates
[updates]
name=CentOS-\$releasever - Updates
baseurl=http://$mirrors_server/centos/\$releasever/updates/\$basearch/
enabled=0
priority=10
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6

#additional packages that may be useful
[extras]
name=CentOS-\$releasever - Extras
baseurl=http://$mirrors_server/centos/\$releasever/extras/\$basearch/
enabled=0
priority=10
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-6
EOF

cat <<EOF > /etc/yum.repos.d/epel.repo
[epel]
name=Extra Packages for Enterprise Linux 6 - \$basearch
baseurl=http://$mirrors_server/epel/6/\$basearch/
failovermethod=priority
enabled=1
priority=9
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6
EOF

cat <<EOF > /etc/yum.repos.d/remi.repo
[remi]
name=Les RPM de remi pour Enterprise Linux 6 - \$basearch
baseurl=http://$mirrors_server/enterprise/6/remi/\$basearch/
enabled=1
priority=8
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi
failovermethod=priority

[remi-php55]
name=Les RPM de remi de PHP 5.5 pour Enterprise Linux 6 - \$basearch
baseurl=http://$mirrors_server/enterprise/6/php55/\$basearch/
enabled=1
priority=8
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi
failovermethod=priority

[remi-php56]
name=Les RPM de remi de PHP 5.6 pour Enterprise Linux 6 - \$basearch
baseurl=http://$mirrors_server/enterprise/6/php56/\$basearch/
enabled=0
priority=8
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi
failovermethod=priority
EOF

#percona
cat <<EOF > /etc/yum.repos.d/Percona.repo
# Name: Percona RPM Repository
# URL: http://www.percona.com/percona-lab.html
[percona]
name = CentOS \$releasever - Percona
baseurl=http://$mirrors_server/percona/centos/\$releasever/os/\$basearch/
enabled = 1
priority=40
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-percona
gpgcheck = 0
EOF

yum install -y yum-priorities
yum clean all
yum makecache

