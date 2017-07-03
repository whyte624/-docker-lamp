# Use Alpine Linux
FROM alpine:edge

# Maintainer
MAINTAINER Andrei S <whyte624@gmail.com>

RUN	apk update && \
	apk upgrade && \
	apk add --update \
	    git \
	    apache2 \
	    curl \
	    acl \
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
		mysql \
		mysql-client