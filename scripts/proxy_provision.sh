
# Install and configure Squid proxy if not installed
[ -f /etc/squid/squid.conf ] || {
    apt-get update
    apt-get install -y squid
    cp /etc/squid/squid.conf /etc/squid/squid.conf.bak
    cp /vagrant/conf/squid.conf /etc/squid/squid.conf
    systemctl restart squid.service
}
