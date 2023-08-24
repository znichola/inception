#!/bin/bash

function cf {
    read -p "Do you want to: $1 ? (y/n): " choice
    case "$choice" in
        [Yy]) return 0 ;;
        [Nn]) return 1 ;;
        *) echo "Invalid choice. Please enter 'y' for Yes or 'n' for No." ; exit 42;
    esac
}

print "\
Basic cli tools needed to setup the host machine
it's a good idea to run this with sudo
"

if cf "apt install -y vim jq pwgen"; then
	apt install -y vim jq pwgen
fi

if cf "make wd and db directories"; then
	mkdir -p /home/znichola/data/wordpress
	mkdir -p /home/znichola/data/mariadb
	mkdir -p /home/znichola/data/svelt
fi

if cf "add znichola.42.fr to hosts"; then
	printf "\n# Inception project\n127.0.0.1	znichola.42.fr\n" >> /etc/hosts
fi
