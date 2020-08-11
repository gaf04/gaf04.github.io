#!/bin/sh

convert "$1"\
    -resize 640x\>\
    -define jpeg:extent=32kb\
    -strip\
    "$2"
