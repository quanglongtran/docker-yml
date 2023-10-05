FROM wyveo/nginx-php-fpm:php81
LABEL MAINTAINER quanglong

WORKDIR /usr/share/nginx/html

RUN apt update
RUN apt install php8.1-xdebug composer zsh git-core curl fonts-powerline -y
ENV ZSH /root/.oh-my-zsh
RUN git clone https://github.com/ohmyzsh/ohmyzsh.git $ZSH

ENV SHELL=/bin/zsh
RUN cp $ZSH/templates/zshrc.zsh-template ~/.zshrc
RUN echo "zend_extension=xdebug.so\nxdebug.remote_enable=1\nxdebug.remote_autostart=1" > /etc/php/8.1/mods-available/xdebug.ini
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
COPY ./.zshrc /root

# install latest neovim
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN ./nvim.appimage --appimage-extract
RUN mv squashfs-root /
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim
RUN rm ./nvim.appimage

# theme for neovim
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
RUN mkdir /root/.config/nvim -p
RUN touch /root/.config/nvim/init.vim
COPY ./init.vim /root/.config/nvim/init.vim
RUN nvim -c ":execute 'PlugInstall' | q | q!"

# hihi
COPY ./index.php /usr/share/nginx/html
