#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

log "entrypointing into node\n"

if [ $1 == "tail" ]; then
	log " doing infinate loop tail\n"
	log " empty folder so we need to do the copy bullshit"

	cp /sveltapp-backup /root/sveltapp2
	cd /root/sveltapp2
	npm install

else

	log "done sleeping handing over the process to what came before\n"
fi


exec "$@"
