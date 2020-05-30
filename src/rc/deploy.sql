\echo -- Creating WEB_ANON role

CREATE ROLE web_anon NOLOGIN;

\echo -- Granting USAGE on schemas API to WEB_ANON

GRANT USAGE ON SCHEMA api TO web_anon;

\echo -- Granting SELECT on API.ARCHIVE to WEB_ANON

GRANT SELECT ON api.archive TO web_anon;

\echo -- Granting SELECT on API.BACKLOG to WEB_ANON

GRANT SELECT ON api.backlog TO web_anon;

\echo -- Granting SELECT on API.JOURNAL to WEB_ANON

GRANT SELECT ON api.journal TO web_anon;

\echo -- Creating TASK_USER role

CREATE ROLE task_user NOLOGIN;

\echo -- Granting USAGE on schemas DATA, API to TASK_USER

GRANT USAGE ON SCHEMA data, api TO task_user;

\echo -- Granting SELECT on API.ARCHIVE to TASK_USER

GRANT SELECT ON api.archive TO task_user;

\echo -- Granting SELECT, INSERT, UPDATE, DELETE on API.BACKLOG to TASK_USER

GRANT SELECT, INSERT, UPDATE, DELETE ON api.backlog TO task_user;

\echo -- Granting SELECT, INSERT, UPDATE, DELETE on API.JOURNAL to TASK_USER

GRANT SELECT, INSERT, UPDATE, DELETE ON api.journal TO task_user;

\echo -- Granting USAGE on sequence TASK_ID_SEQ

GRANT USAGE ON SEQUENCE data.task_id_seq TO task_user;

\echo -- Creating AUTHENTICATOR role

CREATE ROLE authenticator NOINHERIT LOGIN PASSWORD 'password';

\echo -- Granting WEB_ANON to AUTHENTICATOR

GRANT web_anon TO authenticator;

\echo -- Granting TASK_USER to AUTHENTICATOR

GRANT task_user TO authenticator;
