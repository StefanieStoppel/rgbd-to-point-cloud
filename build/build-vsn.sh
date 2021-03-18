#!/usr/bin/env bash

DEFAULT_REPO_DIR="$HOME/Desktop/CVP/vanillasegnet"
REPO_DIR="${DEFAULT_REPO_DIR}"

while getopts ":r:" opt; do
  case $opt in
    r) REPO_DIR="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Run script to start Morphing and Sampling Network docker container
bash "$REPO_DIR/build-docker-image.sh"