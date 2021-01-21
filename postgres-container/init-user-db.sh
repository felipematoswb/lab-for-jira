#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER user_jira;
    ALTER USER user_jira WITH PASSWORD 'pass_jira' -d template1
    CREATE DATABASE jiradb WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
    GRANT ALL PRIVILEGES ON DATABASE jiradb TO user_jira;
EOSQL