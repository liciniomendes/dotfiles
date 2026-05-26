#!/bin/bash
# This script is to be used on arm64 macbooks only
# the reason is that there isn't an official release
# on GH for them
# https://github.com/Samsung/netcoredbg
# This will build it locally and copy to the right place
#
# First time is required to give execution permissions
# $ chmod +x ~/.config/nvim/scripts/build-netcoredbg.sh
# To run use the next line
# $ ~/.config/nvim/scripts/build-netcoredbg.sh
set -e

INSTALL_DIR="$HOME/.local/share/nvim/mason/packages/netcoredbg"
BUILD_DIR="/tmp/netcoredbg-build"
REPO_DIR="/tmp/netcoredbg-src"

echo "==> Cloning netcoredbg..."
rm -rf "$REPO_DIR"
git clone --depth=1 https://github.com/Samsung/netcoredbg "$REPO_DIR"

echo "==> Configuring build..."
rm -rf "$BUILD_DIR"
mkdir -p "$BUILD_DIR"
cd "$BUILD_DIR"

CC=$(brew --prefix llvm)/bin/clang \
CXX=$(brew --prefix llvm)/bin/clang++ \
cmake "$REPO_DIR" \
  -DCMAKE_INSTALL_PREFIX="$BUILD_DIR/bin" \
  -DCMAKE_BUILD_TYPE=Release \
  -DDOTNET_DIR="$(dirname $(which dotnet))"

echo "==> Building..."
cmake --build . --target install -j$(sysctl -n hw.ncpu)

echo "==> Installing to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
cp "$BUILD_DIR/bin/"* "$INSTALL_DIR/"

echo "==> Done!"
"$INSTALL_DIR/netcoredbg" --version
