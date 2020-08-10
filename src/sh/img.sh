#!/bin/sh

convert "$1"\
    -strip\
    -ordered-dither 3x3\
    -transparent white\
    "$2"
