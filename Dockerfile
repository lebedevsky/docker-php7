FROM lebedevsky/docker-ubuntu16
MAINTAINER an.lebedevsky@gmail.com

RUN apt-add-repository -y ppa:ondrej/php && \
    apt-get update

RUN apt-get install -y \
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
            php7.1-redis \
            php7.1-memcached \
            php7.1-mongodb \
            php7.1-xdebug
# clean
RUN apt-get autoclean

# composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php 
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod a+x /usr/local/bin/composer

# yii2
RUN composer global require "fxp/composer-asset-plugin:^1.3.1"

# codecept
RUN php -r "copy('http://codeception.com/codecept.phar', 'codecept.phar');"
RUN mv codecept.phar /usr/local/bin/codecept
RUN chmod a+x /usr/local/bin/codecept

COPY ./env/ ./etc

EXPOSE 9000

CMD ["php-fpm7.1"]