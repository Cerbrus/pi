#!/bin/bash

SERVICE=$1

if [ -z "$1" ]
  then
    echo "Missing argument: docker-compose YML file!"
else
    docker-compose -f $SERVICE/docker-compose.yml up --no-start
    docker-compose -f $SERVICE/docker-compose.yml start
fi