#!/usr/bin/env bash
set -e

DEFAULT_DIR="$HOME/Desktop/CVP"
CVP_DIR="${DEFAULT_DIR}"

while getopts ":d:" opt; do
  case $opt in
    d) CVP_DIR="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

# Create CVP_DIR
mkdir -p "$CVP_DIR"

# Run setup scripts
echo "******************"
echo "Setting up repos and sample data..."
bash ./setup/clone-repos.sh -d "$CVP_DIR"
bash ./setup/setup-sample-data.sh -d "$CVP_DIR"

# Build component docker images
echo "******************"
echo "Building component docker images..."
bash ./build/build-docker-images.sh -d "$CVP_DIR"