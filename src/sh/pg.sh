#!/bin/sh

TMP=$(mktemp)

{
	cat > ${TMP}

	echo "<title>$(./sh/ttl.sh < "${TMP}")</title>"
	cat html/head.html

	echo '<style>'
	cat css/def.css
	echo '</style>'

	cat html/header.html

	echo '<main>'
	echo '<article>'
	markdown -f footnote < ${TMP}
	echo '</article>'
	echo '</main>'

	cat html/footer.html
} | hxnormalize

rm ${TMP}
