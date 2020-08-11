.PHONY: all html img clean clhtml climg

IMG != find img -type f | sed -e 's/\..*/.jpg/' -e 's/^/..\//'

all: html img

html:
	./sh/build/html.sh

img: ${IMG}

../img/%.jpg: img/%.png ./sh/img.sh
	./sh/img.sh "$<" "$@"

../img/%.jpg: img/%.jpg ./sh/img.sh
	./sh/img.sh "$<" "$@"

clean:
	./sh/clean/html.sh
	./sh/clean/img.sh
