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

PIPELINE_DIR="$CVP_DIR/pipeline"
mkdir -p "$PIPELINE_DIR"

# Copy point cloud ground truths to $PIPELINE_DIR
PC_COMPLETE_DIR="$PIPELINE_DIR/pc_complete"
echo "Copying point cloud ground truths to $PC_COMPLETE_DIR..."
cp -r "./pc_complete" "$PC_COMPLETE_DIR"

# Copy example_inputs of YCB-Video frames to $PIPELINE_DIR
EXAMPLE_INPUTS_DIR="$PIPELINE_DIR/example_inputs"
echo "Copying example YCB-Video frames to $EXAMPLE_INPUTS_DIR..."
cp -r "./example_inputs" "$EXAMPLE_INPUTS_DIR"
