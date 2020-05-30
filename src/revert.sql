\set QUIET on

\set ON_ERROR_STOP on

BEGIN;

\echo -- Reverting rc...

\ir rc/revert.sql

\echo -- Reverting api...

\ir api/revert.sql

\echo -- Reverting data...

\ir data/revert.sql

\echo -- Dropping PGTAP extension

DROP EXTENSION pgtap;

COMMIT;
