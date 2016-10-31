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

EXPOSE 9000

ENTRYPOINT ["php-fpm", "-F"]
