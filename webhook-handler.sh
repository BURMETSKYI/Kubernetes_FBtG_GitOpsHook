#!/bin/bash

# Define your GitHub repository and Docker image name
REPO_URL="https://github.com/BURMETSKYI/Kubernetes_FBtG_GitOpsHook.git"
PROJECT_DIR="/home/user1/gitopshook"
DOCKER_COMPOSE_FILE="$PROJECT_DIR/docker-compose.yml"  # Optional if using docker-compose

# Pull the latest changes from GitHub
cd $PROJECT_DIR || exit
git pull $REPO_URL main

# Rebuild and restart Docker containers
docker-compose -f $DOCKER_COMPOSE_FILE down
docker-compose -f $DOCKER_COMPOSE_FILE up -d --build
