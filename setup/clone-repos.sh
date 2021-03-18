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

function git_clone_or_pull() {
  REPOSRC=$1
  LOCALREPO=$2
  BRANCH=${3:-"master"}

  # We do it this way so that we can abstract if from just git later on
  LOCALREPO_VC_DIR=$LOCALREPO/.git

  if [ ! -d $LOCALREPO_VC_DIR ]
  then
      echo "Cloning $REPOSRC into $LOCALREPO..."
      git clone -b $BRANCH $REPOSRC $LOCALREPO
  else
      echo "$LOCALREPO already exists, pulling changes..."
      cd $LOCALREPO
      git checkout $BRANCH
      git pull $REPOSRC
  fi
}

# Create CVP_DIR
mkdir -p "$CVP_DIR" && cd "$CVP_DIR"

# Clone component repos
echo "Cloning repositories into $CVP_DIR..."
git_clone_or_pull "git@gitlab.com:cvp1/vue-flask-image-upload.git" "$CVP_DIR/vue-flask-image-upload"
git_clone_or_pull "git@gitlab.com:cvp1/vanillasegnet.git" "$CVP_DIR/vanillasegnet"
git_clone_or_pull "git@gitlab.com:cvp1/morping-and-sampling-network.git" "$CVP_DIR/morping-and-sampling-network"
printf "Finished cloning \n"