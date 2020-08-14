#!/bin/sh

TMP=$(mktemp)

_md() {
	pandoc "$@"
}

_ttl() {
	./sh/ttl.sh\
	    | _md\
	    | sed -e 's/^<p/<h1 id=title/'\
		  -e 's|<p/>$|<h1/>$|'
}

{
	echo '<!DOCTYPE html>'
	echo '<html lang=en>'

	cat > ${TMP}

	echo "<title>$(./sh/ttl.sh < "${TMP}")</title>"
	cat html/head.html

	echo '<style>'
	cat css/def.css
	echo '</style>'

	cat html/header.html

	echo '<main>'
	echo '<article>'
	echo '<header>'
	_ttl < ${TMP}
	echo '</header>'
	./sh/nottl.sh < ${TMP} | _md
	echo '</article>'
	echo '</main>'

	cat html/footer.html
} | hxnormalize

rm ${TMP}
