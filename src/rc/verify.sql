BEGIN;

SELECT plan(13);

SELECT has_role('web_anon');

SELECT schema_privs_are('api', 'web_anon', array ['USAGE']);

SELECT table_privs_are('api', 'archive', 'web_anon', array ['SELECT']);

SELECT table_privs_are('api', 'backlog', 'web_anon', array ['SELECT']);

SELECT table_privs_are('api', 'journal', 'web_anon', array ['SELECT']);

SELECT has_role('task_user');

SELECT schema_privs_are('api', 'task_user', array ['USAGE']);

SELECT table_privs_are('api', 'archive', 'task_user', array [ 'SELECT' ]);

SELECT table_privs_are('api', 'backlog', 'task_user', array [ 'SELECT', 'INSERT', 'UPDATE', 'DELETE' ]);

SELECT table_privs_are('api', 'journal', 'task_user', array [ 'SELECT', 'INSERT', 'UPDATE', 'DELETE' ]);

SELECT has_role('authenticator');

SELECT is_member_of('web_anon', 'authenticator');

SELECT is_member_of('task_user', 'authenticator');

SELECT finish();

ROLLBACK;
