#!/bin/bash

# Dumb script to run postgresql bootstrapping for bitbucket.
# Test only. Not suitable for reuse.

ROLE_USER=$1
ROLE_PASSWD=$2
DATABASE_NAME=$3

if [ "$#" -ne 3 ]; then
  echo "You must pass ROLE_USER, ROLE_PASSWD and DATABASE_NAME"
  exit 1
fi


su - -c "psql -c \"CREATE ROLE ${ROLE_USER} WITH LOGIN PASSWORD '\"${ROLE_PASSWD}\"' VALID UNTIL 'infinity';\"" postgres


su - -c "psql -c \"CREATE DATABASE ${DATABASE_NAME} WITH ENCODING='UTF8' OWNER=${ROLE_USER} CONNECTION LIMIT=-1;\"" postgres