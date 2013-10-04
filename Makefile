.PHONY: js-env pages

REPO=dreamplate

# default build task
build:
	make js-env

# build generic version
js-env:
	mkdir -p js-env
	rm js-env/*
	cp excanvas.js js-env/excanvas.js
	cp ie8/build/ie8.js js-env/ie8.js
	cp timers.js js-env/timers.js
	cp dom4/build/dom4.js js-env/dom4.js
	cp eddy/build/eddy.dom.js js-env/eddy.js
	cp sos.js js-env/sos.js
	cp JSON-js/json2.js js-env/json2.js
	cp es5-shim/es5-shim.min.js js-env/es5-shim.js
	cp es5-shim/es5-sham.min.js js-env/es5-sham.js
	cp Function.prototype.bind.js js-env/Function.bind.js
	cp String.prototype.trim.js js-env/String.trim.js

# create the reamplate page
pages:
	git pull --rebase
	make js-env
	mkdir -p ~/tmp
	mkdir -p ~/tmp/$(REPO)
	cp -rf js-env ~/tmp/$(REPO)
	cp base.html ~/tmp/$(REPO)
	git checkout gh-pages
	mkdir -p js-env
	rm -rf js-env/*
	cp -rf ~/tmp/$(REPO) js-env
	mv js-env/base.html ./base.html
	git add js-env
	git commit -m 'automatic dreamplate generator'
	git push
	git checkout master
	rm -r ~/tmp/$(REPO)