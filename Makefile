TARGETS := dist/assets/js/whispers.js dist/assets/js/whispers.min.js dist/assets/css/whispers.css

.PHONY: clean build deploy prodjs

clean:
	@-rm -f $(TARGETS)

deploy: build
	rsync -avr --chown=www-data:www-data --checksum --delete -e ssh dist/ AkashaR:neophilus/whispers

build: prodcss prodindex prodjs

dist/assets/js/whispers.js:
	elm make src/Main.elm --output=dist/assets/js/whispers.js --optimize

dist/assets/js/whispers.min.js: dist/assets/js/whispers.js
	uglifyjs dist/assets/js/whispers.js --compress 'pure_funcs="F2,F3,F4,F5,F6,F7,F8,F9,A2,A3,A4,A5,A6,A7,A8,A9",pure_getters,keep_fargs=false,unsafe_comps,unsafe' | uglifyjs --mangle --output=dist/assets/js/whispers.min.js

prodjs: dist/assets/js/whispers.min.js
	@-rm -f dist/assets/js/whispers.js

serve: dist/assets/js/init.js debugindex debugcss
	elm-live src/Main.elm -d dist --open -- --output=dist/assets/js/whispers.js --optimize

debug: dist/assets/js/init.js debugindex debugcss
	elm-live src/Main.elm -d dist --open -- --output=dist/assets/js/whispers.js --debug

debugcss: src/whispers.css
	cp src/whispers.css dist/assets/css/whispers.css

prodcss: src/whispers.css
	crass src/whispers.css --optimize > dist/assets/css/whispers.css

prodindex: dist/index.html
	sed -i 's/whispers*.js/whispers.min.js/' dist/index.html

debugindex: dist/index.html
	sed -i 's/whispers*.js/whispers.js/' dist/index.html
