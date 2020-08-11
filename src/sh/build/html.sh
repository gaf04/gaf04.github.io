#!/bin/sh

for __f in html/* css/*; do
	[ "$__f" -nt .update ] && FORCE_REBUILD=1
done

_dst() {
	echo "$*" | sed -e 's/^md/../' -e 's/\.md$/.html/'
}

_has_md() {
	find -L "$*" -type f -name '*.md' | grep -q .
}

_has_ind() {
	[ -f "$*/index.md" ] || [ -f "$*/index.html" ]
}

_dirs() {
	find -L md -type d | while read -r __d; do
		_has_md "$__d" && ! _has_ind "$__d" && echo "$__d"
	done
}

_files() {
	find -L md -type f -name '*.md' | grep -v README
}

_should_build() {
	 ! [ -f "$2" ] || [ "$1" -nt "$2" ] || [ "$FORCE_REBUILD" ]
}

for __f in $(_files); do
	__df="$(_dst "$__f")"
	 _should_build "$__f" "$__df" && {
		mkdir -pv "$(dirname "$__df")"
		./sh/pg.sh < "$__f" > "$__df"
		echo "$__f -> $__df"
	} &
done

for __d in $(_dirs); do
	{
		./sh/ind.sh "$__d" | ./sh/pg.sh > "$(_dst "$__d/index.html")"
		echo "INDEX $__d"
	} &
done

wait

touch .update
