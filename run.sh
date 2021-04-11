#!/bin/bash

echo "Build backend image"
sh ./api/build.sh

echo "Build frontend image"
sh ./client/build.sh

echo "Applying kubernetes configuration files"
for FILE in k8s/*.yaml; do kubectl apply -f $FILE; done 