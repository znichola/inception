#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

log "entrypointing into node\n"

if [ -e /root/svelteapp/package-lock.json ]; then
	log "nothing for script to do, handing over\n"
else
	log "Svelte projekt is empty, copy over\n"

	pwd

	cp -r /svelteapp-backup/. /root/svelteapp/
	npm install
#	npm i -D @sveltejs/adapter-static
fi

log "build static site\n"

npm run build

cp /root/svelteapp/build/. /root/deploy

exec "$@"
