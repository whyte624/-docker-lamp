FROM ubuntu:xenial

MAINTAINER Andrei S <whyte624@gmail.com>

RUN apt-get update
RUN apt-get install --assume-yes software-properties-common python-software-properties nano git curl acl
RUN apt-get install --assume-yes locales
RUN locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN apt-get install --assume-yes apache2 php7.1 php7.1-curl php7.1-intl php7.1-mbstring php7.1-gd php7.1-gmp php7.1-bcmath php7.1-mysql php7.1-dom php7.1-zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV SYMFONY_ENV test
COPY composer.json /composer-cache/composer.json
COPY composer.lock /composer-cache/composer.lock
RUN cd /composer-cache && composer install --no-interaction --no-scripts --no-autoloader
RUN rm -rf /composer-cache 
