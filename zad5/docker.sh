#!/bin/bash
# autor: Filip Czaplicki fc359081
LAB_ID=$(echo -n "$(hostname)" | tail -c 2)
IMAGE_NAME=fc359081
VSOLAB=vsolab$LAB_ID
SOLAB=solab$LAB_ID

docker build -t $IMAGE_NAME .
docker run -h $SOLAB -d -p 80:80 $IMAGE_NAME
CONTAINER_ID=$(docker ps -lq)
docker exec $CONTAINER_ID /bin/bash "-c" "echo $VSOLAB > /var/www/html/index.html"

./create_ca.sh
./cert.sh
