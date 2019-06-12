TARGETS := dist/assets/js/whispers.js

.PHONY: clean build rebuild deploy

rebuild: clean build

clean:
	@-rm -f $(TARGETS)

deploy: build

dist/assets/js/whispers.js:
	elm make src/Main.elm --output=dist/assets/js/whispers.js --optimize

build: dist/assets/js/whispers.js

serve: dist/assets/js/init.js
	elm-live src/Main.elm -d dist --pushstate --open -- --output=dist/assets/js/whispers.js --optimize

debug: dist/assets/js/init.js
	elm-live src/Main.elm -d dist --pushstate --open -- --output=dist/assets/js/whispers.js --debug
