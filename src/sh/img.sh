#!/bin/sh

convert "$1"\
    -resize 1200\
    -strip\
    -colors 16\
    -ordered-dither c5x5\
    -transparent white\
    "$2"
