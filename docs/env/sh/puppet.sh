#!/bin/sh
# vim: ts=4:sw=4
# http://yum.puppetlabs.com/el/6/products/x86_64/
# puppet master --configprint all
# puppet master --configprint <setting>
#
# remove the current SSL information
# find /var/lib/puppet -type f -print0 | xargs -0r rm
# find $(puppet master --configprint ssldir) -name "$(puppet master --configprint certname).pem" -delete
# rm -rf /var/lib/puppet
#
# notice: Run of Puppet configuration client already in progress; skipping ?????
# ?????puppet????????????puppet??????????????????
# rm /var/lib/puppet/state/puppetdlock
# ???????http://bbs.linuxtone.org/forum-viewthread-tid-8480-fromuid-1049.html
#

yum install -y ntp crontabs puppet

# ?????$????????\$?
cat > /etc/puppet/puppet.conf <<"EOF"
[main]
    logdir = /var/log/puppet
    rundir = /var/run/puppet
    ssldir = $vardir/ssl

[development]
    modulepath = $confdir/environments/development/modules
    manifest = $confdir/environments/development/manifests/site.pp

[testing]
    modulepath = $confdir/environments/testing/modules
    manifest = $confdir/environments/testing/manifests/site.pp

[agent]
    classfile = $vardir/classes.txt
    localconfig = $vardir/localconfig

    # environment = development

    server = puppet.dev.cn
    report = false
    pluginsync = false
EOF

sed -i /puppet/d /etc/hosts
echo "10.80.1.22   puppet.dev.cn  puppet" >> /etc/hosts

chkconfig puppet on

