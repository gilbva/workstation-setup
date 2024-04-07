
function install_basic_tools {
    sudo apt install curl wget git-all net-tools iproute2 \
        netcat dnsutils iputils-ping iptables nmap tcpdump \
        traceroute openssl -y
}

function install_chrome {
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    sudo apt --fix-broken install
    rm google-chrome-stable_current_amd64.deb
}

function install_nodejs {
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
}

function install_java {
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
}

function install_python {
    sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y
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
    source ~/.bashrc
    python -m ensurepip --upgrade
}

function install_dotnet {
    sudo apt-get update \
     && sudo apt-get install -y dotnet-sdk-6.0 \
     && sudo apt-get install -y dotnet-sdk-7.0 \
     && sudo apt-get install -y dotnet-sdk-8.0
    dotnet --version
}

function install_go {
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
}

function install_cpp {
    sudo apt install -y build-essential
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:ubuntu-toolchain-r/test
    sudo apt install gcc-9 g++-9 gcc-9-base gcc-9-doc libstdc++-9-dev libstdc++-9-doc -y
    sudo apt install gcc-10 g++-10 gcc-10-base gcc-10-doc libstdc++-10-dev libstdc++-10-doc -y
    sudo apt install gcc-11 g++-11 gcc-11-base gcc-11-doc libstdc++-11-dev libstdc++-11-doc -y
    sudo apt install gcc-12 g++-12 gcc-12-base gcc-12-doc libstdc++-12-dev libstdc++-12-doc -y
    sudo apt install gcc-13 g++-13 gcc-13-base gcc-13-doc libstdc++-13-dev libstdc++-13-doc -y
    sudo apt install make cmake pkg-config -y

    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 130 --slave /usr/bin/g++ g++ /usr/bin/g++-13 --slave /usr/bin/gcov gcov /usr/bin/gcov-13
}

function install_opengl {
    sudo apt-get update
    sudo apt-get install mesa-utils libglu1-mesa-dev freeglut3-dev mesa-common-dev -y
    sudo apt-get install libglew-dev libglfw3-dev libglm-dev -y
    sudo apt-get install libao-dev libmpg123-dev -y
}

function install_editors {
    sudo snap install code --classic
    sudo snap install atom --classic
}

function install_jetbrain_pro {
    sudo snap install intellij-idea-ultimate --classic
    sudo snap install rider --classic
    sudo snap install goland --classic
    sudo snap install pycharm-professional --classic
    sudo snap install webstorm --classic
    sudo snap install datagrip --classic
    sudo snap install clion --classic
}

function install_jetbrain_comm {
    sudo snap install pycharm-community --classic
    sudo snap install intellij-idea-community --classic
}

function install_virtualization {
    sudo apt update
    sudo apt install cpu-checker
    sudo apt install qemu-kvm libvirt-daemon-system libguestfs-tools virt-manager virt-top -y
    sudo adduser $USER libvirt
    sudo sed -i 's|#security_driver = "selinux"|security_driver = "none"|g' /etc/libvirt/qemu.conf
    sudo systemctl enable --now libvirtd
    sudo systemctl start libvirtd
}

function download_imgs {
    sudo wget http://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img -O /var/lib/libvirt/images/noble-server-cloudimg-amd64.img
    sudo wget http://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img -O /var/lib/libvirt/images/jammy-server-cloudimg-amd64.img
    sudo wget http://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64-disk-kvm.img -O /var/lib/libvirt/images/focal-server-cloudimg-amd64-disk-kvm.img
}

function install_docker {
    sudo apt-get update
    sudo apt-get install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    sudo apt-get install docker-ce docker-ce-cli containerd.io \
        docker-buildx-plugin docker-compose-plugin -y
    sudo groupadd docker
    sudo usermod -aG docker $USER

    sudo systemctl enable docker.service
    sudo systemctl enable containerd.service
}

function install_lxc {
    snap install lxd --channel=latest/stable
    sudo adduser $USER lxd
}

function install_vagrant {
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install vagrant -y

    # vagrant libvirt
    sudo apt install libvirt-dev -y
    vagrant plugin install vagrant-libvirt
    echo "export VAGRANT_DEFAULT_PROVIDER=libvirt" >> ~/.bashrc
    source ~/.bashrc
}

function install_kubernetes {
    # kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    chmod +x kubectl
    sudo mv kubectl /usr/local/bin

    # bash
    curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

    # kind
    [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64
    chmod +x ./kind
    sudo mv ./kind /usr/local/bin/kind

    # k3sup
    curl -sLS https://get.k3sup.dev | sh
    sudo mv k3sup /usr/bin/
}

function install_terraform {
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
    sudo apt update && sudo apt-get install terraform -y
}

function install_ansible {
    pip install --user ansible
    echo 'export PATH=$PATH:~/.local/bin' >> ~/.bashrc
    source ~/.bashrc
}

function install_test_tools {
    # postman
    sudo snap install postman

    # k6
    sudo gpg -k
    sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
    echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
    sudo apt-get update && sudo apt-get install k6 -y
}


install_basic_tools
install_chrome
install_nodejs
install_java
install_python
install_dotnet
install_go
install_cpp
install_opengl
install_editors
install_jetbrain_pro
install_virtualization
download_imgs
install_docker
install_lxc
install_vagrant
install_kubernetes
install_terraform
install_ansible
install_test_tools