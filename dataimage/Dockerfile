FROM ubuntu:latest

RUN apt-get update && apt-get install -y git \
	python-pip \
	fontconfig \
	wget

# Setup home environment
RUN useradd -m dev
WORKDIR /home/dev
ENV HOME /home/dev
RUN mkdir -p $HOME/bin
RUN mkdir -p $HOME/lib
RUN mkdir -p $HOME/include
ENV PATH $HOME/bin:$PATH
ENV PKG_CONFIG_PATH $HOME/lib/pkgconfig
ENV LD_LIBRARY_PATH $HOME/lib

# Install powerline
RUN pip install --user git+git://github.com/Lokaltog/powerline

# Install powerline fonts
RUN wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
RUN mkdir -p $HOME/.fonts/ && mv PowerlineSymbols.otf $HOME/.fonts/
RUN fc-cache -vf $HOME/.fonts
RUN mkdir -p $HOME/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf $HOME/.config/fontconfig/conf.d/

# Install Vundle for vim plugin management
RUN git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

# Install tpm for tmux plugin management
RUN git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

COPY .bashrc $HOME/.bashrc
COPY .tmux.conf $HOME/.tmux.conf
COPY .vimrc $HOME/.vimrc
COPY .gitconfig $HOME/.gitconfig

# Make home dir files read/write for user
RUN chown -R dev:dev $HOME

# Change to user
USER dev

# Drop me into bash
CMD /bin/bash
