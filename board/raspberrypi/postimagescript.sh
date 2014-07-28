#!/bin/sh

BOARD="$(dirname "$(readlink -qsne "${0}")")"
IMAGES="${1}"
BUILD="${IMAGES}/.."

# generate image file
cd "${BUILD}/"
sudo "${BOARD}/mkimage"

exit 0
