#!/usr/bin/env bash
set -e

CVP_DIR="$HOME/Desktop/CVP"

while getopts ":d:" opt; do
  case $opt in
    d) CVP_DIR="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Set repo paths
WEB_APP_DIR="$CVP_DIR/vue-flask-image-upload"
VSN_DIR="$CVP_DIR/vanillasegnet"
MSN_DIR="$CVP_DIR/morping-and-sampling-network"

# Build all docker images
echo "++++++++++++++++"
echo "Building Web Component docker image..."
bash "$WEB_APP_DIR/build-docker-image.sh"
echo "++++++++++++++++"
echo "Building VSN Component docker image..."
bash "$VSN_DIR/build-docker-image.sh"
echo "++++++++++++++++"
echo "Building MSN Component docker image..."
bash "$MSN_DIR/build-docker-image.sh"