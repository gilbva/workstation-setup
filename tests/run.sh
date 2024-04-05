#!/bin/bash

rootdir=$(readlink -f "$0")
rootdir=$(dirname "$rootdir")

red='\033[0;31m'
green='\033[0;32m'
clear='\033[0m'

declare -A java_versions=([21]=21.0.2-amzn [17]=17.0.10-amzn [11]=11.0.22-amzn [8]=8.0.402-amzn)

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

function test_java {
    java_version=$1
    sdk_version=${java_versions[$java_version]}
    sdk use java $sdk_version > /dev/null 2>&1 \
        && cd java_tests/mvn-jdk$java_version \
        && mvn install > /dev/null 2>&1
    check_status $? "java$java_version"
    cd $rootdir
}

function test_python {
    python_version=$1
    pyenv local $python_version > /dev/null 2>&1 \
        && cd "python_tests/python$python_version" \
        && python . > /dev/null 2>&1
    check_status $? "python$python_version"
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

# sourcing sdkman
. ~/.sdkman/bin/sdkman-init.sh
check_status $? "sdkman"

# tests java
test_java 8
test_java 11
test_java 17
test_java 21

test_python "3.8" "3_8"
test_python "3.9" "3_9"
test_python "3.10" "3_10"
test_python "3.11" "3_11"
test_python "3.12" "3_12"