#!/bin/sh
# usage: make_board_image.sh <front_side.png> <back_side.png>

cut_out () {
    convert -shave 150x0 -trim -bordercolor black -border 20 "$1" "$2"
}
recombine () {
    montage -geometry +0+0 -tile 1x -gravity west -background black  "$1" "$2" "$3"
}
compress () {
    pngquant "$1" --strip -s 1 --force --output "$1"
    optipng -o 2 "$1"
}

src1="$1"
src2="$2"
trim1="${src1%%.png}.trimmed.png"
trim2="${src2%%.png}.trimmed.png"
#dst="${src1%%.png}.montage.png"

cut_out "$src1" "$trim1"
cut_out "$src2" "$trim2"
#recombine "$trim1" "$trim2" "$dst"
compress "$trim1"
compress "$trim2"
