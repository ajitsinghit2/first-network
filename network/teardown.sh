#!/bin/bash

# Shut down the Docker containers that might be currently running.
docker-compose -f docker-compose.yml stop

# Shut down the Docker containers for the system tests.
docker-compose -f ./docker-compose.yml kill && docker-compose -f ./docker-compose.yml down

# Remove the local state
rm -f ~/.hfc-key-store/*

# Remove chaincode docker images
docker rmi $(docker images dev-* -q)
docker kill $(docker ps -q)
docker rm $(docker ps -a -q)
