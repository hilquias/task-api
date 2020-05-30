include .env

start:
	./bin/postgrest api.conf

create-db:
	createdb

drop-db:
	dropdb ${PGDATABASE}

psql:
	psql

deploy:
	psql -f src/deploy.sql

revert:
	psql -f src/revert.sql

verify:
	xargs pg_prove < tests.txt

.PHONY: start create-db drop-db psql deploy revert verify

.EXPORT_ALL_VARIABLES:
