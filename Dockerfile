# Use Alpine Linux
FROM alpine:edge

# Maintainer
MAINTAINER Andrei S <whyte624@gmail.com>

RUN	apk update && \
	apk upgrade && \
	apk add --update --no-cache\
	    bash \ 
	    gawk \
	    sed \ 
	    grep \
	    bc \
	    coreutils \
	    git \
	    apache2 \
	    curl \
	    acl \
	    nano \
	    openssh \
	    php7 \
		php7-curl \
		php7-intl \
		php7-mbstring \
		php7-gd \
		php7-gmp \
		php7-bcmath \
		php7-pdo_mysql \
		php7-dom \
		php7-zip \
		php7-json \
		php7-phar \
		php7-xml \
		php7-tokenizer \
		php7-xmlwriter \
		php7-ctype \
		php7-zlib \
		php7-mcrypt \
		mysql \
		mysql-client

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
ENV SYMFONY_ENV test
COPY composer.json /composer-cache/composer.json
COPY composer.lock /composer-cache/composer.lock
RUN cd /composer-cache && composer install --no-interaction --no-scripts --no-autoloader
RUN rm -rf /composer-cache 
