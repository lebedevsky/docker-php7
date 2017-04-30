# docker-php7
https://hub.docker.com/r/khanhicetea/php7-fpm-docker/~/dockerfile/
https://github.com/nimmis/docker-apache-php7/blob/master/Dockerfile
https://github.com/zercle/docker-ubuntu/blob/master/Dockerfile
https://github.com/fbarrento/docker-yii2/blob/master/7.0/Dockerfile

http://php.net/manual/ru/funcref.php
https://launchpad.net/ubuntu/+source/php7.1


#sudo apt-get install php7.1 php7.1-cli php7.1-common libapache2-mod-php7.1 php7.1-mysql php7.1-fpm php7.1-curl php7.1-gd php7.1-bz2 php7.1-mcrypt php7.1-json php7.1-tidy php7.1-mbstring php-redis php-memcached

RUN apt-get install -y --force-yes 
php7.1-bcmath 
php7.1-bz2 
php7.1-cli 
php7.1-common 
php7.1-curl
php7.1-dev 
php7.1-fpm 
php7.1-gd 
php7.1-gmp 
php7.1-imap 
php7.1-intl
php7.1-json 
php7.1-ldap 
php7.1-mbstring 
php7.1-mcrypt 
php7.1-mysql
php7.1-odbc 
php7.1-opcache 
php7.1-pgsql 
php7.1-phpdbg 
php7.1-pspell
php7.1-readline 
php7.1-recode 
php7.1-soap 
php7.1-sqlite3
php7.1-tidy 
php7.1-xml 
php7.1-xmlrpc 
php7.1-xsl 
php7.1-zip
php-tideways 
php-mongodb


RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum install -y \
        php71w \
        php71w-common \
        php71w-fpm \
        php71w-cli \
        php71w-gd \
        php71w-intl \
        php71w-mbstring \
        php71w-mcrypt \
        php71w-mysql \
        php71w-pgsql \
        php71w-opcache \
        php71w-xml \
        php71w-imap \
        php71w-snmp \
        php71w-bcmath \
        php71w-pecl-memcached \
        php71w-pecl-mongodb \
        php71w-pecl-redis \
        php71w-pecl-xdebug
RUN yum -y clean all

# composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# yii2
RUN composer global require "fxp/composer-asset-plugin:^1.3.1"

# codecept
RUN php -r "copy('http://codeception.com/codecept.phar', 'codecept');"
RUN mv codecept /usr/local/bin/codecept
RUN chmod a+x /usr/local/bin/codecept

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]


RUN apt-get install -y \
            php7.1 \
            php7.1-cli \
            php7.1-fpm \
            php7.1-curl \
            php7.0-mcrypt \
            php7.1-opcache \
            php7.1-intl \

            php5-mysql \
            php5-pgsql \



            
            php-imagick \
            php7.1-json \
            

        php71w-gd \
        php71w-mbstring \
        php71w-mysql \
        php71w-pgsql \
        php71w-xml \
        php71w-imap \
        php71w-snmp \
        php71w-bcmath \
        php71w-pecl-memcached \
        php71w-pecl-mongodb \
        php71w-pecl-redis \
        php71w-pecl-xdebug

              php5-cli \
        php5-imagick \
        php5-intl \
        php5-mcrypt \
        php5-mysql \
        php-apc && \



       php5-fpm \
        php5-gd \

        php5-xsl && \




        FROM git.wsmgroup.ru:444/docker-registry/centos:flat

# UPDATE repos
RUN yum -y update && \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install -y php70w php70w-opcache php70w-cli php70w-pdo php70w-mbstring php70w-bcmath php70w-common php70w-process php70w-soap php70w-pear php70w-pecl-apcu php70w-devel php70w-fpm php70w-mysql php70w-xml php70w-gd php70w-mcrypt php70w-intl php70w-imap php70w-devel php70w-pecl-imagick mariadb php70w-pecl-memcached  && \
    yum install -y --enablerepo=wsm-mainline openssl-libs ssmtp git php70w-pecl-geoip php70w-pecl-gearman && \
    yum -y clean all


ADD ssmtp /etc/ssmtp/

ADD GeoIP.conf /etc/

RUN geoipupdate

ADD php-fpm.d /etc/php-fpm.d
ADD php-fpm.conf /etc/
ADD php.ini /etc/
#ADD php.d   /etc/php.d
ADD phpunit /usr/bin/
ADD browscap.ini /etc/


RUN curl -sS https://getcomposer.org/installer | php ; mv composer.phar /usr/bin/composer


RUN composer global require "fxp/composer-asset-plugin:@stable"


RUN groupadd -g 3111 www
RUN useradd -m -u 799 -g www -s /sbin/nologin nginx
#RUN mkdir /var/lib/php/session/
RUN chmod -R 777 /var/lib/php/ && \
    chmod -R 777 /var/log/php-fpm/ && \
    chown -R nginx /var/lib/php/


# expose HTTP port
EXPOSE 9000


VOLUME /var/log/

#VOLUME /etc/php-fpm.d/


ENTRYPOINT /usr/sbin/php-fpm -F



            php7.1 \
            php7.1-common \
            php7.1-cli \
            php7.1-fpm \
            php7.1-curl \
            php7.1-mbstring \
            php7.1-mcrypt \
            php7.1-opcache \
            php7.1-intl \
            php7.1-pdo \
            php7.1-mysql \
            php7.1-pgsql \
            php7.1-gd \
            php7.1-json \
            php7.1-xml \
            php7.1-xsl \
            php7.1-redis \
            php7.1-memcached \
            php7.1-mongodb \
            php7.1-xdebug \
            php7.1-bz2 \
            php7.1-bcmath \
            php7.1-gmp \
            php7.1-imap \
            php7.1-ldap \
            php7.1-odbc \
            php7.1-pspell \
            php7.1-readline \
            php7.1-recode \
            php7.1-soap \
            php7.1-sqlite3 \
            php7.1-tidy \
            php7.1-xmlrpc \
            php7.1-zip \
            php7.1-posix \
            php7.1-sysvmsg \
            php7.1-sysvsem \
            php7.1-sysvshm \

