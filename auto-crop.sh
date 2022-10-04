#!/bin/bash

## Autocrop all the original JPG images in a given directory.
## See https://www.imagemagick.org/Usage/crop/#trim_noisy

## Change value of FUZZ to accomodate slight color changes in scan
FUZZ="50%"


if [ "$#" -ne 2 ]; then
    echo "First argument must specify the directory containing .jpg images."
    echo "Second argument must specify the directory to write cropped images."
    exit 1
fi

INPUT_DIR=$(realpath $1)
OUTPUT_DIR=$(realpath $2)

mkdir -p ${OUTPUT_DIR}
cd ${INPUT_DIR}

ls -1 *.jpg \
    | grep -v ".cropped.jpg" \
    | sed 's/.jpg$//' \
    | xargs -iXX bash -c 'convert -verbose -virtual-pixel edge -crop \
            $(magick XX.jpg -virtual-pixel edge -blur 0x15 -fuzz '${FUZZ}' \
                     -trim -format "%wx%h%O" info:) \
            XX.jpg '${OUTPUT_DIR}'/XX.cropped.jpg'
