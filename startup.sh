#!/bin/bash

# Stop any running containers
docker stop chrishargis.com

# Remove any containers
docker rm chrishargis.com

# Remove app image
docker rmi chrishargis.com

# Build app image
docker build -t chrishargis.com .

# Start app container
docker run -dit \
    --name chrishargis.com \
    -p 80:80 \
    -v $PWD/src:/var/www/chrishargis.com \
    chrishargis.com;