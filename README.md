# Docker App connection to Rabbitmq #


## References
Routing with Flask
[https://hackersandslackers.com/flask-routes/](https://hackersandslackers.com/flask-routes/)

Building faster Containers for Python
[https://blog.realkinetic.com/building-minimal-docker-containers-for-python-applications-37d0272c52f3](https://blog.realkinetic.com/building-minimal-docker-containers-for-python-applications-37d0272c52f3)

Code comments with Docstrings
[https://www.datacamp.com/community/tutorials/docstrings-python#second-head](https://www.datacamp.com/community/tutorials/docstrings-python#second-head)

***

### DOCKER DEPLOYMENT ###

The scripts were tested in Ubuntu 18.04 VM. 

Install docker  ```bash 1_installDocker.sh```

Run containers ``` bash 2_runContainer.sh```

This script deploys a **Python** app alongside a **Rabbitmq** container. Test Python app route in *localhost:9000/test*

To delete everything use script ```3_deleteContainer.sh```

