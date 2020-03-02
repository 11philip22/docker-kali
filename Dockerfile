FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    dnsutils \
    tmux \
    vim \
    zsh

RUN rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 1000
RUN useradd -d /home/kali -u 1000 -g 1000 -m kali
RUN adduser kali sudo
RUN echo 'kali:kali' | chpasswd

USER 1000
