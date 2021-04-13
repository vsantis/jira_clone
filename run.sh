#!/bin/bash

echo "Login into Docker Hub..."
docker login

echo "Build backend image..."
sh ./api/build.sh

echo "Build frontend image..."
sh ./client/build.sh

echo "Create backend repository..."
docker tag vsantis/backend-jira-clone:latest vsantis/backend-jira-clone:latest

echo "Create frontend repository..."
docker tag vsantis/frontend-jira-clone:latest vsantis/frontend-jira-clone:latest

echo "Push repositories..."
docker push vsantis/backend-jira-clone:latest
docker push vsantis/frontend-jira-clone:latest

echo "Applying kubernetes configuration files..."
for FILE in k8s/*.yaml; do kubectl apply -f $FILE; done 