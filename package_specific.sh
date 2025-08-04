#! /bin/bash

set -eu -o pipefail

set -eu -o pipefail

REPO=https://github.com/facebookresearch/detectron2.git
COMMIT_OR_TAG=v0.6
PACKAGE_DIR=detectron2

# Clone the repo if it doesn't exist
if [ ! -d "$PACKAGE_DIR" ]; then
  git clone "$REPO" "$PACKAGE_DIR"
fi

cd "$PACKAGE_DIR"
git fetch
git checkout "$COMMIT_OR_TAG"

# Confirm setup.py exists
if [[ ! -f setup.py ]]; then
  echo "❌ Error: setup.py not found in $(pwd)"
  exit 1
fi

# (Optional) Modify or patch setup.py here
# sed -i 's/.../.../' setup.py

echo "✅ Ready to build detectron2 from $(pwd)"

