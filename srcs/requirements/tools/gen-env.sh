#!/bin/bash

printf "\033[96m~ Generate ENV ~\033[0m\n"

WP_DB_USER=db_user
WP_DB_USER_PWD=$(pwgen -s1 4)
WP_ADMIN=keymaker
WP_ADMIN_PWD=$(pwgen -s1 4)
WP_USER=znichola
WP_USER_PWD=$(pwgen -s1 4)

# printf "\
# Wordpress login details
# Admin: keymaker | \033[92m$WP_ADMIN_PWD\033[0m
#  User: znichola | \033[92m$WP_USER_PWD\033[0m
# 
# Mariadb user details
#         db_user | \033[92m$WP_DB_USER_PWD\033[0m
# "

printf "\
# ENV for the containters
# it's automaticaly generated from a shell script

WP_ADMIN=$WP_ADMIN
WP_ADMIN_PWD=$WP_ADMIN_PWD
WP_USER=$WP_USER
WP_USER_PWD=$WP_USER_PWD
WP_DB_USER=$WP_DB_USER
WP_DB_USER_PWD=$WP_DB_USER_PWD
"> .env

printf "\n env generated\n"
