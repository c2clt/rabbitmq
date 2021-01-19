#!/bin/bash
# author: Andre Rosa
# 18 JAN 2021
# objective: Run Container with an external volume/storage
#-----------------------------------------------------------------------------

#-----------------------------------------------------------------------------
# VARIABLES - DEFINING EXTERNAL/LOCAL AND INTERNAL VOLUMES MAPPING
# **** The local volume MUST be an absolute path
# CHANGE THESE VOLUME PATHS TO MATCH YOUR MACHINE
HOST_VOLUME="/home/andre/Desktop/data" # map volume in host, add your own path
CTN_VOLUME="/data"  # mapping volume in container 
IMAGE_NAME="myapp_img"
CTN_NAME="myapp_ctn"
APP_PORT="8005" # original app port as defined in code
MAP_PORT="9000" # docker mapped port, unique number to avoid collision with other containers
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
cp ./requirements/requirements.prod.txt ./requirements.txt
cp ./environments/.env.prod ./.env # not used in this tutorial, important for Vubble-Registry labeling
#------------------------------------------------------------------------------

docker network create -d bridge vubble_backend
docker-compose up --build -d # run docker-compose file


#------------------------------------------------------------------------------
# 1. Deploy Rabbitmq
#docker run -d --hostname rabbitmq --name rabbitmq rabbitmq:3.8.9-alpine
#cd rabbitmq 
#docker build -t rabbitmq_img .
#docker run -d --restart unless-stopped -p --name rabbitmq rabbitmq_img
#cd ..
# RabbitMQ container listen to port 5672
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# 2. Create the image from the Dockerfile (check the Dockerfile)
echo "Building Image from Dockerfile" # use -t to add name and tag, don't forget the final "."
#docker build -t ${IMAGE_NAME} .
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# 3. Run the app container 
# Run Container in interactive mode with volume for testing (Comment the CMD line in dockefile)"
#docker run -it -v ${HOST_VOLUME}:${CTN_VOLUME} ${IMAGE_NAME} bash
# NOTE THE MAPPING BETWEEN CONTAINER AND EXTERNAL VOLUME
#docker run -d --restart unless-stopped -v ${HOST_VOLUME}:${CTN_VOLUME} -p ${MAP_PORT}:${APP_PORT} --name ${CTN_NAME} ${IMAGE_NAME}
# Check app in http://localhost:9000/
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
# NOTES
# To delete a previous image it is necessary to delete the containers that depends on it:

# 1. Check the list of containers (including inactive/stopped containers)
# docker ps -la

# 2. Delete the container (use container id or name)
# docker rm <containerid or name>

# 3. Now it is possible to delete image
# docker rmi <imagename>

# 4. To delete all locally created docker objects
# docker system prune