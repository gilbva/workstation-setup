# Workstation Setup

This setup is intended to be use in kubuntu, usually in a bare-metal machine, but can be used with a vm as well, please check out README-VM.md for instructions virtual machines running on qemu.

# Basic Tools

## Bash tools

First we need some cli standard tools 

    sudo apt install curl wget

## Chrome

From this trhead we can install chrome https://askubuntu.com/questions/1461513/help-with-installing-the-chrome-web-browser-22-04-2-lts

    # download chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    # install chrome
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    # fix any broken packages
    sudo apt --fix-broken install
    # remove installer
    rm google-chrome-stable_current_amd64.deb
    # run chrome
    google-chrome-stable

# Programiming Langages SDKs

## Node with NVM (node version manager)

See https://github.com/nvm-sh/nvm for the latest version and instructions

    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    nvm -v
    nvm install node
    nvm use node
    node -v
    npm -v

## Java and related tools with sdkman

See https://sdkman.io/ for more details on how to setup sdkman

    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    sdk version
    sdk install java 21.0.2-amzn
    sdk install java 17.0.10-amzn
    sdk install java 11.0.22-amzn
    sdk install java 8.0.402-amzn

    sdk install groovy 4.0.20
    sdk install gradle 8.7
    sdk install maven 3.9.6
    sdk install liquibase 4.27.0

    sdk use groovy 4.0.20
    sdk use gradle 8.7
    sdk use maven 3.9.6
    sdk use liquibase 4.27.0

    groovy -version
    java -version
    gradle -version
    mvn -version
    liquibase -version

## Python with pyenv

See https://github.com/pyenv/pyenv for more details on how to setup pyenv

    curl https://pyenv.run | bash
    