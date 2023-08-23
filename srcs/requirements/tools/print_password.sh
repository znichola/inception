#!/bin/bash

print_value() {
printf "\

  Wordpress login details
    Admin: keymaker | \033[92m$WP_ADMIN_PWD\033[0m
     User: znichola | \033[92m$WP_USER_PWD\033[0m

  Mariadb user details
            db_user | \033[92m$WP_DB_USER_PWD\033[0m

"
}

# Specify the path to your .env file
ENV_FILE="$1"

# Check if the .env file exists
if [ -f "$ENV_FILE" ]; then
    # Read the .env file line by line
    while IFS= read -r line; do
        # Check if the line is not empty and does not start with #
        if [ -n "$line" ] && [[ "$line" != \#* ]]; then
            # Split the line into key and value
            key="${line%%=*}"
            value="${line#*=}"

            # export values 
            export "$key=$value"
        fi
    done < "$ENV_FILE"
else
    echo "The .env file does not exist."
fi

print_value
