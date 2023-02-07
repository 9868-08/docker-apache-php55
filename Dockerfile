FROM ubuntu:14.04
MAINTAINER Roman Ermolaev <9868.08@gmail.com>

VOLUME ["/var/www"]

#RUN docker-php-ext-install mysqli mysqlnd pdo pdo_mysql zip 
RUN apt-get update -yqq --force-yes && \
    apt-get install -yqq --force-yes \
      apache2 \
      php5 \
      php5-cli \
      libapache2-mod-php5 \
      php5-gd \
      php5-json \
      php5-ldap \
      php5-mysql \
      php5-pgsql \
      php5-curl

#RUN docker-php-ext-install curl

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY php.ini /etc/php5/apache2/php.ini
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 80
CMD ["/usr/local/bin/run"]


