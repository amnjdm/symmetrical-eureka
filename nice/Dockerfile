FROM ubuntu:latest

RUN apt-get update && apt-get install -y mercurial \
	git \
	python \
	python-pip \
	curl \
	wget \
	fontconfig \
	vim \
	strace \
	diffstat \
	pkg-config \
	cmake \
	build-essential \
	tcpdump \
	tmux \
	sudo

# Setup home environment
RUN useradd dev
WORKDIR /home/dev
ENV HOME /home/dev

# http://askubuntu.com/questions/581458/how-to-configure-locales-to-unicode-in-a-docker-ubuntu-14-04-container
ENV LANG en_US.UTF-8

# Make home dir files read/write for user
RUN chown -R dev:dev $HOME

# Change to user
USER dev

# Drop me into bash
CMD /bin/bash
# Look into ZSH
# CMD /bin/zsh
