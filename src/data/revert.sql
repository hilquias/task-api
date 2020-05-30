\echo -- Changing SEARCH_PATH to DATA

SET LOCAL search_path TO data;

\echo -- Dropping TASK table

DROP TABLE task;

\echo -- Changing SEARCH_PATH to DEFAULT

SET LOCAL search_path TO default;

\echo -- Dropping DATA schema

DROP SCHEMA data;
