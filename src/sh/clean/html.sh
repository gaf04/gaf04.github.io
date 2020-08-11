#!/bin/sh

_files() {
	find -L .. -type f -name '*.html' | grep -v src
}

_files | while read -r __f; do
	rm -v "$__f"
done
