FROM wyveo/nginx-php-fpm:php81
LABEL MAINTAINER quanglong

WORKDIR /usr/share/nginx/html

RUN useradd quanglong
RUN chown -R quanglong .
RUN apt update
RUN apt install neovim php8.1-xdebug composer zsh git-core curl fonts-powerline -y
ENV ZSH /root/.oh-my-zsh
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH

ENV SHELL=/bin/zsh
RUN cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
RUN git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k
RUN sed -i 's/ZSH_THEME=".*"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
RUN echo "zend_extension=xdebug.so\nxdebug.remote_enable=1\nxdebug.remote_autostart=1" > /etc/php/8.1/mods-available/xdebug.ini
