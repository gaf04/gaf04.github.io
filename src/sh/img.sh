#!/bin/sh

convert "$1"\
    -strip\
    -colorspace Gray\
    -ordered-dither 4x1\
    -transparent white "$2"
