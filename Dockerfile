
FROM ubuntu:latest

RUN apt-get update &&\
    apt-get -y upgrade

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y install apache2 curl nano certbot net-tools

RUN a2enmod ssl && \
    a2enmod http2 && \
    a2enmod rewrite && \
    a2enmod proxy_http && \
    a2enmod ssl && \
    a2enmod headers

# Manually set up the apache environment variables
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid 
EXPOSE 80 443 

# By default, simply start apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
