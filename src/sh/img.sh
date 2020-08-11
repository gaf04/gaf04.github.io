#!/bin/sh

convert "$1"\
    -strip\
    -resize 600\
    -colorspace Gray\
    -ordered-dither c5x5\
    -transparent white\
    "$2"
