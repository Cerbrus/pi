#!/bin/bash

SERVICE=$1

if [ -z "$1" ]
  then
    echo "Missing argument: docker-compose YML file!"
else
    docker-compose -f $SERVICE up --no-start
    docker-compose -f $SERVICE start
fi