#!/bin/sh

[ -f "$*/.noindex" ] && exit
[ -f "$*/README.md" ] && (cat "$*/README.md"; echo)

_files() {
	find -L "$*" -maxdepth 1 -name '*.md' | grep -v README
}

_files "$*" | while read -r __f; do
	echo " - [$(./sh/ttl.sh < "$__f")]($(basename "$__f" | sed 's/\.md$/.html/'))"
done
