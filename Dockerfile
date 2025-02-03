FROM debian:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    postfix \
    mailutils \
    libsasl2-modules \
    rsyslog \
    iputils-ping \
    net-tools bind9-utils telnet nano procps  \
    && apt-get clean

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

RUN sed -i '/imk/s/.*/#&/g' /etc/rsyslog.conf
# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

LABEL org.opencontainers.image.source https://github.com/sagipael/docker-mailrelay
