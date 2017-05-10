FROM php:7.0-apache

WORKDIR /var/www

RUN docker-php-source extract \
    && apt-get update \
    && apt-get install -y libmagickwand-dev libpng-dev libldap2-dev nano curl unzip --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-install pdo pdo_mysql mysqli gd imagick \
    && docker-php-ext-enable imagick \
    && a2enmod rewrite \
    && docker-php-source delete \
    && curl -Lo phpbb.zip hhttps://www.phpbb.com/files/release/phpBB-3.2.0.zip \
    && unzip phpbb.zip \
    && mv phpBB3/* /var/www/html/ \
    && bash -c "mv phpBB3/.[^.]* /var/www/html/" \
    && rm -rf phpbb.zip phpBB3 \ 
    && chown -R www-data:www-data /var/www/html \
    && chmod 755 -R /var/www/html \
    && chmod 660 images/avatars/upload/ config.php \
    && chmod 770 store/ cache/ files/ \
    && apt-get clean \ 
    && apt-get autoclean \ 
    && apt-get autoremove --purge -y \ 
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/*


