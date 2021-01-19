# using oficial image from docker hub https://hub.docker.com/_/python
FROM python:3.7.7-slim-buster as base

FROM base as builder

# Create app directory
RUN mkdir app

# Python dependencies    
COPY requirements/requirements.prod.txt /requirements.txt   
COPY environments/.env.prod /.env

# install C++ dependencies for python packages, if necessary
#RUN apt update
#RUN apt install gcc -y
#RUN apt install g++ -y
#RUN apt install make
#RUN apt install net-tools
#RUN apt install openssh-server -y

# install dependencies
RUN pip install -r requirements.txt 

# copy app source to container root after running pip install
# this maked the rebuild faster because of layer caching
COPY main.py /app 
 
WORKDIR /app  

RUN rm -rf ./requirements ./environments

# the same port of the app
#EXPOSE 8005
# to run this app the command is 'node app.js'
RUN echo "Starting App"
CMD [ "python", "./main.py" ]

#------------------------------------------------------------------------------------


