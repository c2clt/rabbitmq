#!/bin/bash
# author: Andre Rosa
# 18 JAN 2021
# objective: Stop and Erase all images and containers
# THIS DOES NOT SAVES SPACE ON DISK, TO DELETE EVERYTHING RUN SCRIPT 4
#-----------------------------------------------------------------------------

# STOPS AND DELETES ALL CONTAINERS
docker container stop $(docker container ls -aq)
docker container rm $(docker container ls -aq)

# DELETE DOCKER NETWORK
docker network rm vubble_backend

