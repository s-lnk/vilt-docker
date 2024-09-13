FROM php:8.3-fpm

ENV UID=${UID}
ENV GID=${GID}
ENV USER=${USER}

RUN apt-get update \
    && apt-get install -y \
       libpq-dev \
       curl \
       wget \
       zip \
       unzip \
       vim \
       libzip-dev \
       libmcrypt-dev \
       libldap2-dev \
       postgresql-client \
       libpng-dev \
       libjpeg62-turbo-dev \
       libfreetype6-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pdo_mysql zip bcmath pcntl exif \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd


# Redis
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

RUN useradd ${USER}
RUN usermod -u ${UID} ${USER} && groupmod -g ${GID} ${USER}
RUN id -u root
RUN id -u ${USER}
RUN mkdir /home/${USER} && chown -R ${USER} /home/${USER}

# Install composer
RUN cd /tmp && curl -sS https://getcomposer.org/installer | php \
      && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN mkdir /var/www/app
RUN chown -R ${USER} /var/www/app

# Set current user
USER ${USER}:${USER}

WORKDIR /var/www/app

EXPOSE 9000
