FROM alpine:latest

# Install required packages
RUN apk update && apk add --no-cache \
    postfix \
    cyrus-sasl \
    cyrus-sasl-login \
    rsyslog \
    busybox-extras \
    nano \
    procps \
    bind-tools \
    iputils \
    net-tools \
    bash \
    ca-certificates

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# fix rsyslog configuration
RUN sed -i '/imk/s/.*/#&/g' /etc/rsyslog.conf

# set postfix to listen port 587
RUN sed -i 's/^smtp.*/&\n587       inet  n       -       n       -       -       smtpd/g' /etc/postfix/master.cf

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

