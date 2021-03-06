FROM kalilinux/kali-rolling

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    dnsutils \
    tmux \
    vim \
    zsh \
    curl \
    ca-certificates \
    git \
    less \
    python3 \
    python3-pip \
    python3-setuptools \
    nmap \
    neofetch

RUN rm -rf /var/lib/apt/lists/*

RUN pip3 install --no-cache-dir \
    ipython

RUN chsh -s /usr/bin/zsh \
    && sh -c "$(curl -fsSL https://raw.githubusercontent.com/11philip22/oh-my-zsh/master/tools/install.sh)"

RUN groupadd -g 1000 1000
RUN useradd -d /home/kali -u 1000 -g 1000 -m kali -s /usr/bin/zsh
RUN adduser kali sudo
RUN echo 'kali:kali' | chpasswd

USER 1000
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/11philip22/oh-my-zsh/master/tools/install.sh)"

WORKDIR /home/kali
CMD tail -f /dev/null
