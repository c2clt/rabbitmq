# RabbitMQ Tutorial - with Docker, Python & RabbitMQ #


### REQUIREMENTS ###

- These scripts were tested in Ubuntu 18.04 and Ubuntu 20.04 Computers

- Internet access for Docker and RabbitMQ download 


### DEPLOY APP - BASH SCRIPTS ###

The scripts were tested in Ubuntu 18.04 VM. 

- Install docker  ```bash 1_installDocker.sh``` (At the script top change to your user name before running)

- Run containers ``` bash 2_runContainer.sh```. The script deploys a **Python** app alongside a **Rabbitmq** container. Test Python app route in *localhost:9000/test*

- Delete the container and images created use script ```3_deleteContainer.sh```

- Erase everything and recover all disk space use script ```4_deleteEverything.sh``` (this will erase all images including the original Python)


### TESTING THE APP ###

- Check the running containers with the command ```docker ps```

- Check the logs of the myapp container with ```docker logs <containerid>``` (as container id it is possible to use the first 2 or 3 digits)

- Use the route *http://localhost:9000/write* and *http://localhost:9000/read* to post/retrieve from RabbitMQ



