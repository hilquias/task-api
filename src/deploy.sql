\set QUIET on

\set ON_ERROR_STOP on

BEGIN;

\echo -- Creating PGTAP extension

CREATE EXTENSION pgtap;

\echo -- Deploying data...

\ir data/deploy.sql

\echo -- Deploying api...

\ir api/deploy.sql

\echo -- Deploying rc...

\ir rc/deploy.sql

COMMIT;
