#!/usr/bin/env bash

CVP_DIR="$HOME/Desktop/CVP"
USE_GPU="" # "" or "True
ENVIRONMENT="segmentation" # set this to "train", "test" or "segmentation" using the -e option

while getopts ":d:e:g:" opt; do
  case $opt in
    d) CVP_DIR="$OPTARG"
    ;;
    e) ENVIRONMENT="$OPTARG"
    ;;
    g) USE_GPU="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

REPO_DIR="$CVP_DIR/vanillasegnet"
HOST_MOUNT_DIR="$CVP_DIR/pipeline"

if [ "$USE_GPU" == "True" ]; then
    echo "Specified device: GPU"
else
    echo "Specified device: CPU."
    USE_GPU=""
fi

# Run script to start VanillaSegNet docker container
echo "Starting VSN Component docker container..."
bash "$REPO_DIR/run-docker-container.sh" -h "$HOST_MOUNT_DIR" -e "$ENVIRONMENT" -g "$USE_GPU"