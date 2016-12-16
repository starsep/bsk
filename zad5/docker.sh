#!/bin/bash
# autor: Filip Czaplicki fc359081
LAB_ID=$(echo -n "$(hostname)" | tail -c 2)
IMAGE_NAME=fc359081
CONTAINER_NAME=vsolab$LAB_ID

docker build -t $IMAGE_NAME .
docker run -h $CONTAINER_NAME -d -p 80:80 $IMAGE_NAME
CONTAINER_ID=$(docker ps -lq)
docker exec $CONTAINER_ID /bin/bash "-c" "echo solab$LAB_ID > /var/www/html/index.html"
