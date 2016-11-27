#!/bin/sh

# value
FORWARD1=${FORWARD1:-8.8.8.8}
FORWARD2=${FORWARD1:-8.8.4.4}
HOSTNAME=$(hostname -s)
DOMAIN=$(hostname -d)
DOMAIN1=${DOMAIN:-example.lan}
NS1=${NS1:-192.168.0.1}
MAIL=${MAIL:-192.168.0.1}
POP3=${POP3:-192.168.0.1}
IMAP=${IMAP:-192.168.0.1}
IMAP4=${IMAP4:-192.168.0.1}
SMTP=${SMTP:-192.168.0.1}
PIDFILE=${PIDFILE:-/var/run/named/named.pid}

# set config
if [ ! -f "/etc/bind/named.conf" ]; then
cat <<EOF>> /etc/bind/named.conf
options {
	directory "/var/bind";
	forwarders {
		$FORWARD1;
		$FORWARD2;
	};

	listen-on port 53 { any; };
	listen-on-v6 { none; };
	pid-file "$PIDFILE";
	allow-transfer { none; };
	allow-query     { any; };
	recursion yes;
	dnssec-enable yes;
    	dnssec-validation yes;
    	dnssec-lookaside auto;
};

zone "." IN {
	type hint;
	file "named.ca";
};

zone "localhost" IN {
	type master;
	file "pri/localhost.zone";
	allow-update { none; };
	notify no;
};

zone "127.in-addr.arpa" IN {
	type master;
	file "pri/127.zone";
	allow-update { none; };
	notify no;
};
 
zone "$DOMAIN1" {
        type master;
        file "/etc/bind/db.$DOMAIN1";
};
EOF
touch /etc/bind/db.$DOMAIN1
cat <<EOF >/etc/bind/db.$DOMAIN1
\$TTL  604800
@      IN      SOA    ns1.$DOMAIN1. root.localhost. (
                              2        ; Serial
                        604800        ; Refresh
                          86400        ; Retry
                        2419200        ; Expire
                        604800 )      ; Negative Cache TTL
;
@     IN      NS      ns1.$DOMAIN1.
@     IN      A      $NS1
@     IN      MX     10     $HOSTNAME.$DOMAIN1.
$HOSTNAME     IN      A      $NS1
ns1     IN      A      $NS1
mail     IN      A      $MAIL
pop3     IN      A      $POP3
imap     IN      A      $IMAP
imap4     IN      A      $IMAP4
smtp     IN      A      $SMTP
EOF
fi

exec "$@"
