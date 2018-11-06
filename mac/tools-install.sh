#!/bin/bash

# general stuff I use in a mac machine

echo "install brew and brew packages"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

for brew_packages in \
  ansible \
  azure-cli \
  bash-completion \
  certbot \
  flyway \
  go \
  git \
  iperf \
  jenv \
  jq \
  kops \
  kubernetes-cli \
  kubernetes-helm \
  postgresql \
  python \
  readline \
  terraforming \
  ; do brew install $brew_packages || brew upgrade $brew_packages  ; done


echo "install pip packages"
sudo easy_install pip

sudo -H pip install awscli --upgrade --ignore-installed six  # just the way awscli likes it
for pip_packages in \
  aws-google-auth \
  shyaml \
  virtualenv \
  ; do sudo -H pip install $pip_packages --upgrade ; done
