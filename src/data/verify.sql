BEGIN;

SET LOCAL search_path TO data, public;

SELECT plan(25);

SELECT has_schema('data');

SELECT has_table('task');

SELECT has_column('task', 'id');
SELECT has_column('task', 'done');
SELECT has_column('task', 'priority');
SELECT has_column('task', 'category');
SELECT has_column('task', 'description');
SELECT has_column('task', 'effort');
SELECT has_column('task', 'estimative');
SELECT has_column('task', 'started_at');
SELECT has_column('task', 'started_on');

SELECT col_type_is('task', 'id', 'integer');
SELECT col_type_is('task', 'done', 'boolean');
SELECT col_type_is('task', 'priority', 'integer');
SELECT col_type_is('task', 'category', 'text');
SELECT col_type_is('task', 'description', 'text');
SELECT col_type_is('task', 'effort', 'integer');
SELECT col_type_is('task', 'estimative', 'integer');
SELECT col_type_is('task', 'started_at', 'date');
SELECT col_type_is('task', 'started_on', 'time without time zone');

SELECT col_not_null('task', 'id');
SELECT col_not_null('task', 'done');
SELECT col_not_null('task', 'category');
SELECT col_not_null('task', 'description');

SELECT col_is_pk('task', 'id');

SELECT finish();

ROLLBACK;
