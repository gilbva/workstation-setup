# Workstation Setup

This setup is intended to be use in kubuntu, usually in a bare-metal machine, but can be used with a vm as well, please check out README-VM.md for instructions virtual machines running on qemu.

# Basic Tools

## Bash tools

First we need some cli standard tools 

    sudo apt install curl wget git-all
    git --version

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
    nvm install 20
    nvm install 18
    nvm install 16
    nvm install 14
    nvm install 12
    nvm install 10
    nvm install 8
    nvm install 6
    nvm install 4
    nvm use 20
    nvm alias default 20
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

    source ~/.bashrc
    sdk default java 21.0.2-amzn
    sdk default groovy 4.0.20
    sdk default gradle 8.7
    sdk default maven 3.9.6
    sdk default liquibase 4.27.0

    groovy -version
    java -version
    gradle -version
    mvn -version
    liquibase -version

## Python with pyenv

See https://github.com/pyenv/pyenv for more details on how to setup pyenv

    sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    curl https://pyenv.run | bash
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
    source ~/.bashrc
    pyenv install 3.12
    pyenv install 3.11
    pyenv install 3.10
    pyenv install 3.9
    pyenv install 3.8
    pyenv global 3.12
    python -m ensurepip --upgrade
    python3 --version
    pip -V

## C# and .net

See https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-install?pivots=os-linux-ubuntu-2204&tabs=dotnet8 for more details

    sudo apt-get update && sudo apt-get install -y dotnet-sdk-6.0
    sudo apt-get update && sudo apt-get install -y dotnet-sdk-7.0
    sudo apt-get update && sudo apt-get install -y dotnet-sdk-8.0
    dotnet --version

## Go

See https://github.com/go-nv/goenv/blob/master/INSTALL.md for more details

    git clone https://github.com/go-nv/goenv.git ~/.goenv
    echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.bashrc
    echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
    goenv install 1.18
    goenv install 1.19
    goenv install 1.20
    goenv install 1.21
    goenv install 1.22
    goenv global 1.22
    echo 'eval "$(goenv init -)"' >> ~/.bashrc
    echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.bashrc
    echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.bashrc

## C/C++

    sudo apt install -y build-essential
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt install gcc-7 g++-7 gcc-8 g++-8 gcc-9 g++-9 gcc-10 g++-10 gcc-11 g++-11 gcc-12 g++-12 gcc-13 g++-13

    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 130 --slave /usr/bin/g++ g++ /usr/bin/g++-13 --slave /usr/bin/gcov gcov /usr/bin/gcov-13
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 120 --slave /usr/bin/g++ g++ /usr/bin/g++-12 --slave /usr/bin/gcov gcov /usr/bin/gcov-12
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 110 --slave /usr/bin/g++ g++ /usr/bin/g++-11 --slave /usr/bin/gcov gcov /usr/bin/gcov-11
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 100 --slave /usr/bin/g++ g++ /usr/bin/g++-10 --slave /usr/bin/gcov gcov /usr/bin/gcov-10
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 90 --slave /usr/bin/g++ g++ /usr/bin/g++-9 --slave /usr/bin/gcov gcov /usr/bin/gcov-9
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8 --slave /usr/bin/gcov gcov /usr/bin/gcov-8
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 70 --slave /usr/bin/g++ g++ /usr/bin/g++-7 --slave /usr/bin/gcov gcov /usr/bin/gcov-7


# Editors and IDEs

## Free Editors VSCOde, Atom

    sudo snap install code --classic
    sudo snap install atom --classic

## Jetbrains Professional IDEs

For professional editions use this

    sudo snap install intellij-idea-ultimate --classic
    sudo snap install rider --classic
    sudo snap install goland --classic
    sudo snap install pycharm-professional --classic
    sudo snap install webstorm --classic
    sudo snap install datagrip --classic
    sudo snap install clion --classic

## Jetbrains Community IDEs

    sudo snap install pycharm-community --classic
    sudo snap install intellij-idea-community --classic

# Virtualization

## Libvirt, KVM & qemu

See https://ubuntu.com/server/docs/libvirt for more details

    sudo apt update
    sudo apt install cpu-checker
    kvm-ok
    sudo apt install qemu-kvm libvirt-daemon-system
    sudo adduser $USER libvirt
    sudo apt-get install virt-manager 

## Docker

See https://docs.docker.com/engine/install/ubuntu/ for more details

    sudo apt-get update
    sudo apt-get install ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo groupadd docker
    sudo usermod -aG docker $USER

    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service

    docker run hello-world

## Vagrant

See https://developer.hashicorp.com/vagrant/install?ajs_aid=c8d9e40b-3d23-41d6-aad0-3a01d90741cd&product_intent=vagrant for more details

    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install vagrant
    vagrant -v

See https://github.com/vagrant-libvirt/vagrant-libvirt for more details

    sudo apt install libvirt-dev
    vagrant plugin install vagrant-libvirt
    echo "export VAGRANT_DEFAULT_PROVIDER=libvirt" >> ~/.bashrc
    source ~/.bashrc

# Infraestructure

## Kubectl

See https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/ for more details

    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin
    kubectl version

## Terraform

See https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

    sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    wget -O- https://apt.releases.hashicorp.com/gpg | \
      gpg --dearmor | \
      sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    gpg --no-default-keyring \
      --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
      --fingerprint
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
      https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
      sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update
    sudo apt-get install terraform
    terraform -v

## Ansible

See https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-and-upgrading-ansible-with-pip for more details

    pip install --user ansible
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
    source ~/.bashrc

# Tests

## Postman

    sudo snap install postman

## K6

See https://k6.io/docs/get-started/installation/ for more details

    sudo gpg -k
    sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
    echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
    sudo apt-get update
    sudo apt-get install k6