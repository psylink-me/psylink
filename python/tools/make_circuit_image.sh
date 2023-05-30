#!/bin/sh
# usage: make_circuit_image.sh <circuit.svg>
#
# This script converts a circuit schematic SVG into a cropped and
# (lossy-)compressed PNG image ready to be deployed to the PsyLink website.
#
# To generate a circuit schematic SVG:
# - Open the schematic in KiCad
# - Click on "File" -> "Plot..."
# - In the "Plot Schematic Options" dialog,
#     - Select the options "SVG"
#     - Deselect "Plot drawing sheet"
#     - Deselect "Plot background color"
#     - Click "Plot Current Page"
#
# Dependencies: imagemagick, pngquant, optipng

compress () {
    pngquant "$1" --strip -s 1 --force --output "$1"
    optipng -o 2 "$1"
}

src="$1"
dst="${src%%.svg}.png"

convert -density 240 -trim -bordercolor white -border 20 "$src" "$dst"
compress "$dst"
