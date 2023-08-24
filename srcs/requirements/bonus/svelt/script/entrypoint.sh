#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

log "entrypointing into node\n"

if [ -e /root/svelteapp/package-lock.json ]; then
	log "nothing for script to do, handing over\n"
else
	log "Svelte projekt is empty, copy over\n"

	cp -r /svelteapp-backup/. /root/svelteapp/
	npm install
fi


exec "$@"
