FROM wyveo/nginx-php-fpm:php81

WORKDIR /usr/share/nginx/html

RUN useradd quanglong
RUN chown -R quanglong .
RUN apt-get update
RUN apt install neovim php8.1-xdebug -y
RUN echo "zend_extension=xdebug.so\nxdebug.remote_enable=1\nxdebug.remote_autostart=1" > /etc/php/8.1/mods-available/xdebug.ini
