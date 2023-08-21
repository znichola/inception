#!/bin/bash

SITE=$(docker volume inspect wp | jq -r '.[0].Options.device')
cp index.html styles.css  $SITE
