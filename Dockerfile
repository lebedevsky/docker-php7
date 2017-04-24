FROM lebedevsky/docker-centos7
MAINTAINER an.elebedevsky@gmail.com

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
