#!/bin/sh

convert "$1"\
    -strip\
    -resize 1000\
    -colorspace Gray\
    -ordered-dither c5x5\
    -transparent white\
    "$2"
