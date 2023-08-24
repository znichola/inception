#!/bin/bash

log () {
	printf "\e[36m\n > $@ \e[0m"
}

log "entrypointing into node\n"

if [ $1 == "tail" ]; then
	log " doing infinate loop tail\n"
else

	log "done sleeping handing over the process to what came before\n"
fi


exec "$@"
