# chrishargis.com

## Setup
```
# Build the container
docker build -t chrishargis.com .

# Start app container
docker run -dit \
    --name chrishargis.com \
    -p 80:80 \
    -v $PWD/src:/var/www/chrishargis.com \
    chrishargis.com;
```