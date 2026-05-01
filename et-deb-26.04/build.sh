#!/bin/bash
set -e

IMAGE_NAME="et-builder"
CONTAINER_NAME="et-temp"

echo "--- Building Docker Image ---"
docker build -t $IMAGE_NAME . --network host

echo "--- Finding the versioned filename ---"
# This runs a tiny command inside the image to find the .deb path
DEB_PATH=$(docker run --rm $IMAGE_NAME sh -c "ls /src/EternalTerminal/build/*.deb")
DEB_NAME=$(basename $DEB_PATH)

echo "Found: $DEB_NAME"

echo "--- Extracting $DEB_NAME ---"
docker create --name $CONTAINER_NAME $IMAGE_NAME
docker cp $CONTAINER_NAME:$DEB_PATH ./$DEB_NAME

echo "--- Cleaning up ---"
docker rm $CONTAINER_NAME

echo "--- Done! ---"
ls -lh $DEB_NAME
