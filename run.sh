#!/bin/bash

# echo "Login into Docker Hub..."
# docker login

echo "Build backend image..."
sh ./api/build.sh

echo "Build frontend image..."
sh ./client/build.sh

echo "Push repositories..."
docker push us.gcr.io/main-cyclist-310615/api
docker push us.gcr.io/main-cyclist-310615/client

echo "Applying kubernetes configuration files..."
for FILE in k8s/*.yaml; do kubectl apply -f $FILE; done 