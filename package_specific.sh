#! /bin/bash

set -eu -o pipefail

# Define what you want to build
PACKAGE_NAME=detectron2
REPO=https://github.com/facebookresearch/detectron2.git
COMMIT_OR_TAG=v0.6

# Clone the repository if it doesn't exist
if [ ! -d "$PACKAGE_NAME" ]; then
  git clone "$REPO" "$PACKAGE_NAME"
fi

cd "$PACKAGE_NAME"
git checkout "$COMMIT_OR_TAG"

# Debug: list directory contents
echo "✅ Now in directory: $(pwd)"
ls -l

# Check if setup.py exists before modifying
if [[ -f setup.py ]]; then
  echo "🔧 Patching setup.py"
  sed -i 's/^version = .*/version = "0.6"/' setup.py
else
  echo "❌ setup.py not found in $(pwd)"
  exit 1
fi
