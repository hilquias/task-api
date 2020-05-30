BEGIN;

SET LOCAL search_path TO api, public;

SELECT plan(39);

SELECT has_view('archive');

SELECT has_view('backlog');

SELECT has_view('journal');

SELECT has_column('archive', 'id');
SELECT has_column('archive', 'priority');
SELECT has_column('archive', 'category');
SELECT has_column('archive', 'description');
SELECT has_column('archive', 'effort');
SELECT has_column('archive', 'estimative');
SELECT has_column('archive', 'started_at');
SELECT has_column('archive', 'started_on');

SELECT has_column('backlog', 'id');
SELECT has_column('backlog', 'category');
SELECT has_column('backlog', 'description');

SELECT has_column('journal', 'id');
SELECT has_column('journal', 'done');
SELECT has_column('journal', 'priority');
SELECT has_column('journal', 'category');
SELECT has_column('journal', 'description');
SELECT has_column('journal', 'effort');
SELECT has_column('journal', 'estimative');
SELECT has_column('journal', 'started_at');
SELECT has_column('journal', 'started_on');


PREPARE
	backlog_insert
AS INSERT INTO
	backlog (id, category, description)
VALUES
	(100, 'WRITING', 'How to Learn Music'),
	(200, 'FINETUNING', 'How to Learn Music'),
	(300, 'CONDENSING', 'How to Learn Music');


SELECT lives_ok('backlog_insert', 'insert works');


SELECT * INTO TEMPORARY TABLE backlog_100 FROM backlog WHERE id = 100;

SELECT is(id, 100) FROM backlog_100;

SELECT is(category, 'WRITING') FROM backlog_100;

SELECT is(description, 'How to Learn Music') FROM backlog_100;


SELECT * INTO TEMPORARY TABLE backlog_200 FROM backlog WHERE id = 200;

SELECT is(id, 200) FROM backlog_200;

SELECT is(category, 'FINETUNING') FROM backlog_200;

SELECT is(description, 'How to Learn Music') FROM backlog_200;


SELECT * INTO TEMPORARY TABLE backlog_300 FROM backlog WHERE id = 300;

SELECT is(id, 300) FROM backlog_300;

SELECT is(category, 'CONDENSING') FROM backlog_300;

SELECT is(description, 'How to Learn Music') FROM backlog_300;


PREPARE
	backlog_update_200
AS UPDATE
	backlog
SET
	description = 'How to Learn Cooking'
WHERE
	id = 200;

SELECT lives_ok('backlog_update_200', 'update works');

SELECT is(description, 'How to Learn Cooking') FROM backlog WHERE id = 200;


PREPARE
	backlog_delete_all
AS DELETE FROM
	backlog;

SELECT lives_ok('backlog_delete_all', 'delete all works');


PREPARE
	journal_insert
AS INSERT INTO
	journal (id, category, description)
VALUES
	(100, 'WRITING', 'How to Learn Music'),
	(200, 'FINETUNING', 'How to Learn Music'),
	(300, 'CONDENSING', 'How to Learn Music');

SELECT lives_ok('journal_insert', 'insert works');


SELECT * INTO TEMPORARY TABLE journal_100 FROM journal WHERE id = 100;

SELECT is(id, 100) FROM journal_100;

SELECT is(category, 'WRITING') FROM journal_100;

SELECT is(description, 'How to Learn Music') FROM journal_100;


SELECT * INTO TEMPORARY TABLE journal_200 FROM journal WHERE id = 200;

SELECT is(id, 200) FROM journal_200;

SELECT is(category, 'FINETUNING') FROM journal_200;

SELECT is(description, 'How to Learn Music') FROM journal_200;


SELECT * INTO TEMPORARY TABLE journal_300 FROM journal WHERE id = 300;

SELECT is(id, 300) FROM journal_300;

SELECT is(category, 'CONDENSING') FROM journal_300;

SELECT is(description, 'How to Learn Music') FROM journal_300;


PREPARE
	journal_update_200
AS UPDATE
	journal
SET
	description = 'How to Learn Cooking'
WHERE
	id = 200;

SELECT lives_ok('journal_update_200', 'update works');

SELECT is(description, 'How to Learn Cooking') FROM journal WHERE id = 200;


PREPARE
	journal_delete_300
AS DELETE FROM
	journal
WHERE
	id = 300;

SELECT lives_ok('journal_delete_300', 'delete works');


SELECT finish();

ROLLBACK;
