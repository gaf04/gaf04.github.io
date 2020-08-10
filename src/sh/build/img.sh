#!/bin/sh

_dst() {
	echo "$*" | sed -e 's/\..*$/.png/' -e 's/^/..\//'
}

_files() {
	find -L img -type f | grep -v README
}

for __f in $(_files); do
	__df="$(_dst "$__f")"
	echo "$__f -> $__df"
	mkdir -pv "$(dirname "$__df")"
	./sh/img.sh "$__f" "$__df"
done
