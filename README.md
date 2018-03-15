# Jupyterlab on Docker Setup for ML

An easy way to get started with machine learning, using Docker. Containers that
come pre-installed with Jupyterlab and key packages in the scientific
stack.

## Getting Started

* [Setup docker](https://docs.docker.com/get-started/)

* Simply run `make` to build the image.

In order to create a container using the image, either:

* Run `docker run -d -p 443:8888 -v ORIGIN_FOLDER:/home/jpy3/notebooks cagrisofu/jpylab3`
    * Replace `ORIGIN_FOLDER` with a folder on your local machine that you want to persist notebooks in.

or:

* Copy the supplied compose file (`docker-compose.yml`) to the folder on your local machine  that you want keep your notebooks in and run `docker-compose up -d`
    * You can install docker-compose by running `sudo pip install docker-compose`

* The url will be `https://<ip-of-your-host>`

* Before you can start working on your notebooks you need to set your password.
    * Run ` docker exec -it <name-of-your-container> bash` to access the container's shell.
        * You can check the name of your containes by running `docker ps -a`
    * In the container's shell run `jupyter notebook password` and enter your password when prompted.
    * Finally in order to keep your password setting between contained deletions and creations you need to commit the container’s file changes into the image.
        * Run `docker commit <CONTAINER_ID> cagrisofu/jpylab3` 
            * You can find the `CONTAINER_ID` of your container by running `docker ps`.
