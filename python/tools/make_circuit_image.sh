#!/bin/sh
# usage: make_circuit_image.sh <circuit.svg>

compress () {
    pngquant "$1" --strip -s 1 --force --output "$1"
    optipng -o 2 "$1"
}

src="$1"
dst="${src%%.svg}.png"

convert -density 240 -trim -bordercolor white -border 20 "$src" "$dst"
compress "$dst"
