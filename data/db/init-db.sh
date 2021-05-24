#!/bin/bash
set -e

echo "About to initialize the database with some data"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
  create table public.customers (
    customer_id BIGSERIAL,
    name varchar(255) not null,
    address varchar(8000) not null,
    shipping_address varchar(8000) not null
  );

EOSQL

echo "Done initializing the database!"
