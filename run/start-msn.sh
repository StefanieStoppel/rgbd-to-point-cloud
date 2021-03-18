#!/usr/bin/env bash

CVP_DIR="$HOME/Desktop/CVP"
ENVIRONMENT="completion" # set this to "train", "test" or "completion" using the -e option

while getopts ":d:e:" opt; do
  case $opt in
    d) CVP_DIR="$OPTARG"
    ;;
    e) ENVIRONMENT="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

REPO_DIR="$CVP_DIR/morping-and-sampling-network"
HOST_MOUNT_DIR="$CVP_DIR/pipeline"

# Run script to start Morphing and Sampling Network docker container
echo "Starting MSN Component docker container..."
bash "$REPO_DIR/run-docker-container.sh" -h "$HOST_MOUNT_DIR" -e "$ENVIRONMENT"