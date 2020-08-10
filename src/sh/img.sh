#!/bin/sh

convert "$1"\
    -strip\
    -ordered-dither 8x8\
    -transparent white\
    "$2"
