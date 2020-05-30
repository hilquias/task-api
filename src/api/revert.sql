\echo -- Changing SEARCH_PATH to API

SET LOCAL search_path TO api;

\echo -- Dropping ARCHIVE view

DROP VIEW archive;

\echo -- Dropping BACKLOG view

DROP VIEW backlog;

\echo -- Dropping JOURNAL view

DROP VIEW journal;

\echo -- Changing SEARCH_PATH to DEFAULT

SET LOCAL search_path TO default;

\echo -- Dropping API schema

DROP SCHEMA api;
