#!/bin/bash
# author: Andre Rosa
# 25 SEP 2020
# objective: Install Docker and Docker-Compose
#---------------------------------------------------------------------------

USER="andre" # CHANGE HERE FOR YOUR UBUNTU USER NAME

#-------------------------------------------------------
# INSTALL DOCKER & DOCKER-COMPOSE
#-------------------------------------------------------
    apt update
    apt update -q

    # install prerequisites
    apt install apt-transport-https ca-certificates curl software-properties-common -y

    # add key for docker repository
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # add the repository to apt
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

    apt update
    apt-cache policy docker-ce
    echo "Installing Docker 18.06.0"
    apt install docker-ce=18.06.0~ce~3-0~ubuntu -y

    # install compose 1.25.2 (DO NOT USE VERSIONS 1.18 OR LOWER!!! Problem with docker network)
    echo "Installing Docker-Compose 1.25.2"
    curl -L https://github.com/docker/compose/releases/download/v1.25.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
#-------------------------------------------------------

#-------------------------------------------------------
# ADD USER TO DOCKER GROUP (AVOID SUDO PASSWORD REQUESTS)
#-------------------------------------------------------
   groupadd docker
   gpasswd -a $USER docker
   newgrp docker
# must logoff to work