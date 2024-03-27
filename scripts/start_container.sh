#!/bin/bash
set -e

# Get the ID of the running container
container_id=$(docker ps -q)

# Check if the container ID is not empty
if [ -n "$container_id" ]; then
    echo "Running container ID: $container_id"
    
    # Stop the container
    echo "Stopping & deleting container..."
    docker stop $container_id
    docker rm $container_id
else
    echo "No running containers found."
fi

# Pull the Docker image from Docker Hub
docker pull yanishub1/hotel-app:latest

# Run the Docker image as a container
docker run -dit -p 80:80 yanishub1/hotel-app
