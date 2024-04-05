#!/bin/bash

rootdir=$(readlink -f "$0")
rootdir=$(dirname "$rootdir")

red='\033[0;31m'
green='\033[0;32m'
clear='\033[0m'

function check_status {
    status=$1
    test_name=$2
    if [ $status -ne 0 ]; then 
        printf "${red}$test_name failed${clear}\n" 
    else 
        printf "${green}$test_name successful${clear}\n" 
    fi
}

function test_node {
    node_version=$1
    nvm use $node_version > /dev/null 2>&1 \
        && cd node_tests/node$node_version \
        && npm i > /dev/null 2>&1 \
        && npm run start > /dev/null 2>&1
    check_status $? "node$node_version"
    cd $rootdir
}

# test git
git clone https://github.com/go-nv/goenv ./github-test > /dev/null 2>&1
check_status $? "git"
rm -rf ./github-test

# test curl
curl https://www.google.com/ > /dev/null 2>&1
check_status $? "curl"

# test wget
wget https://www.google.com/ -O test1 > /dev/null 2>&1
check_status $? "wget"
rm -rf test1

# sourcing nvm
. ~/.nvm/nvm.sh
check_status $? "nvm"

# tests node 
test_node 4
test_node 6
test_node 8
test_node 10
test_node 12
test_node 14
test_node 16
test_node 18
test_node 20