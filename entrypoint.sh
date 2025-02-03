#!/bin/bash


# Set default values if environment variables are not provided
SMTP_SERVER=${SMTP_SERVER:-"smtp.gmail.com"}
SMTP_PORT=${SMTP_PORT:-587}
SMTP_TLS=${SMTP_TLS:-"yes"}
SMTP_USER=${SMTP_USER:-""}
SMTP_PASSWORD=${SMTP_PASSWORD:-""}
ALLOWED_NETWORKS=${ALLOWED_NETWORKS:-"192.168.1.0/24"}

# Configure Postfix
postconf -e "myhostname = mailrelay.local"
postconf -e "myorigin = \$myhostname"
postconf -e "inet_interfaces = all"
postconf -e "inet_protocols = ipv4"
postconf -e "mydestination ="
postconf -e "relayhost = [$SMTP_SERVER]:$SMTP_PORT"
postconf -e "mynetworks = $ALLOWED_NETWORKS 127.0.0.0/8"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
postconf -e "smtp_sasl_security_options = noanonymous"
postconf -e "smtp_sasl_tls_security_options = noanonymous"
postconf -e "maillog_file = /dev/stdout"

# TLS settings
if [ "$SMTP_TLS" = "yes" ]; then
    postconf -e "smtp_use_tls = yes"
    postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"
else
    postconf -e "smtp_use_tls = no"
fi

# Create authentication file
echo "[$SMTP_SERVER]:$SMTP_PORT $SMTP_USER:$SMTP_PASSWORD" > /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

# start syslog
rsyslogd

# Start Postfix
/usr/lib/postfix/configure-instance.sh -
/usr/sbin/postfix -c /etc/postfix start-fg
