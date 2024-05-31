#!/bin/bash

# Create Docker network if it doesn't exist
if ! docker network ls | grep -q "superset_network"; then
  docker network create superset_network
fi

# Create Docker volumes if they don't exist
if ! docker volume ls | grep -q "superset-mysql_mysql_data"; then
  docker volume create --name=mysql_data
fi

if ! docker volume ls | grep -q "superset-mysql_superset_home"; then
  docker volume create --name=superset_home
fi

# Start Docker Compose services
docker-compose up -d --build
