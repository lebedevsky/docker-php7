FROM lebedevsky/docker-centos7
MAINTAINER an.elebedevsky@gmail.com

RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm && \
    yum install --enablerepo=webtatic-testing -y \
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
        php71w-snmp

RUN yum -y clean all

# composer
CMD ['php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"']
CMD ['php composer-setup.php']
CMD ['php -r "unlink('composer-setup.php');"']
CMD ['mv composer.phar /usr/local/bin/composer']

# yii2
CMD ['composer global require "fxp/composer-asset-plugin:^1.2.0"']

# codecept
CMD ['php -r "copy('http://codeception.com/codecept.phar', 'codecept');"']
CMD ['mv codecept /usr/local/bin/codecept']
CMD ['chmod a+x /usr/local/bin/codecept']

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
