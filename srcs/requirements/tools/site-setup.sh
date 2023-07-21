#!/bin/bash

SITE=$(docker volume inspect $(docker volume ls -q) | jq -r '.[0].Mountpoint')

cp index.html styles.css  $SITE
