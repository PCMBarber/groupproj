#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "qa-portal" <<-EOSQL
    grant all privileges on database "qa-portal" to postgres;
    create database "keycloak";
    grant all privileges on database "keycloak" to postgres;
EOSQL
