#!/bin/bash

# Assign the output of the command to CURRENT_INSTANCE variable
CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor"$IMAGE_NAME" --format="{{.ID}}")

# Check if CURRENT_INSTANCE is not empty
if ["$CURRENT_INSTANCE" ] 
then
  # Perform the desired action
  sudo docker rm $(sudo docker stop  $CURRENT_INSTANCE)

fi
sudo docker pull $IMAGE_NAME

CONTAINER_EXISTS=4(sudo docker sp -a | grep $CONTAINER_NAME)
if ["$CONTAINER_EXISTS" ] 
then    
    sudo docker rm $CONTAINER_NAME

fi

sudo docker run -p 3000:3000 -d --name $CONTAINER_NAME $IMAGE_NAME