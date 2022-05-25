#!/usr/bin/env bash

set -euxo pipefail

# https://imagemagick.org/script/mogrify.php
mogrify \
  `# JPG is generally the most efficient well-supported format for pictures of people` \
  `# As of early 2022, webp still isn't that well supported on older Apple devices - but is probably the future` \
  -format jpg \
  `# The resize and extent parmeters should be the same. They set the size of the output image` \
  `# Resize can be thought of as the canvas size, while extent is the actual image size` \
  `# The caret symbol in the resize argument covers the canvas with the image` \
  `# The gravity argument specifies how we want that covering to be done` \
  -resize "256x256^" \
  -extent 256x256 \
  -gravity center \
  `# We have to choose some background when we convert from a format that supports transparency to one that doesn't` \
  `# White is generally a sensisble default here as that's usually what people expect` \
  `# Transparent profile images are fairly rare, and so this won't be used in most cases` \
  -background white \
  `# Set paths for the files. Important to set with mogrify, otherwise it will overwite your originals!` \
  -path output/ \
  input/*