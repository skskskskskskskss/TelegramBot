#!/bin/bash

set -e

read -e -p "Input your USERNAME : " USER

DB_NAME=${1:-my_pg_user}

DB_USER=${2:-my_awesome_db}

DB_USER_PASS=${3:-hard_password}

sudo su postgres <<EOF

createdb  $DB_NAME;

psql -c "CREATE USER $USER WITH PASSWORD '$USER';"

psql -c "grant all privileges on database $USER to $USER;"

echo "Postgres User '$USER' and database '$USER' created."

EOF
