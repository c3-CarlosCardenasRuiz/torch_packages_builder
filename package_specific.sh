#! /bin/bash

set -eu -o pipefail

# Define repo and target
REPO=https://github.com/facebookresearch/detectron2.git
COMMIT_OR_TAG=v0.6

# Clone the repo
git clone $REPO detectron2
cd detectron2
git checkout $COMMIT_OR_TAG
