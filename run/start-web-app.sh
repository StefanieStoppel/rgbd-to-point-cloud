#!/usr/bin/env bash

CVP_DIR="$HOME/Desktop/CVP"

while getopts ":d:" opt; do
  case $opt in
    d) CVP_DIR="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

REPO_DIR="$CVP_DIR/vue-flask-image-upload"
HOST_MOUNT_DIR="$CVP_DIR/pipeline"

# Run script to start web app docker container
echo "Starting Web Component docker container..."
bash "$REPO_DIR/run-docker-container.sh" "$HOST_MOUNT_DIR"