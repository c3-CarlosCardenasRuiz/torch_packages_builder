#! /bin/bash

set -eu -o pipefail

# Package build parameters
PACKAGE_NAME=detectron2
REPO=https://github.com/facebookresearch/detectron2.git
COMMIT_OR_TAG=v0.6

# Clean up if the folder already exists
rm -rf $PACKAGE_NAME

# Clone and enter repo
git clone "$REPO" "$PACKAGE_NAME"
cd "$PACKAGE_NAME"
git checkout "$COMMIT_OR_TAG"

# Show where we are
echo "📁 Current directory: $(pwd)"
echo "📄 Listing files:"
ls -lh

# Only patch setup.py if it exists
if [[ -f setup.py ]]; then
  echo "🔧 Patching setup.py version"
  sed -i 's/version = .*$/version = "0.6"/' setup.py
else
  echo "❌ ERROR: setup.py not found in $(pwd)"
  exit 1
fi
