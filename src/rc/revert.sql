\echo -- Revoking WEB_ANON from AUTHENTICATOR

REVOKE web_anon FROM authenticator;

\echo -- Revoking TASK_USER from AUTHENTICATOR

REVOKE task_user FROM authenticator;

\echo -- Droppping AUTHENTICATOR role

DROP ROLE authenticator;

\echo -- Revoking USAGE on sequence TASK_ID_SEQ

REVOKE USAGE ON SEQUENCE data.task_id_seq FROM task_user;

\echo -- Revoking USAGE on schemas DATA, API from TASK_USER

REVOKE USAGE ON SCHEMA data, api FROM task_user;

\echo -- Revoking SELECT on API.ARCHIVE from TASK_USER

REVOKE SELECT ON api.archive FROM task_user;

\echo -- Revoking SELECT, INSERT, UPDATE, DELETE on API.BACKLOG from TASK_USER

REVOKE SELECT, INSERT, UPDATE, DELETE ON api.backlog FROM task_user;

\echo -- Revoking SELECT, INSERT, UPDATE, DELETE on API.JOURNAL from TASK_USER

REVOKE SELECT, INSERT, UPDATE, DELETE ON api.journal FROM task_user;

\echo -- Droppping TASK_USER role

DROP ROLE task_user;

\echo -- Revoking SELECT on API.ARCHIVE from WEB_ANON

REVOKE SELECT ON api.archive FROM web_anon;

\echo -- Revoking SELECT on API.BACKLOG from WEB_ANON

REVOKE SELECT ON api.backlog FROM web_anon;

\echo -- Revoking SELECT on API.JOURNAL from WEB_ANON

REVOKE SELECT ON api.journal FROM web_anon;

\echo -- Revoking USAGE on schemas API from WEB_ANON

REVOKE USAGE ON SCHEMA api FROM web_anon;

\echo -- Droppping WEB_ANON role

DROP ROLE web_anon;
