\echo -- Creating API schema

CREATE SCHEMA api;

\echo -- Changing SEARCH_PATH to API

SET LOCAL search_path TO api;

\echo -- Creating ARCHIVE view

CREATE VIEW archive
        ( id
	, priority
	, category
	, description
	, effort
	, estimative
	, started_at
	, started_on )
AS SELECT
          t.id
	, t.priority
	, t.category
	, t.description
	, t.effort
	, t.estimative
	, t.started_at
	, t.started_on
FROM
	data.task t
WHERE
	t.done;

\echo -- Creating BACKLOG view

CREATE VIEW backlog
        ( id
	, category
	, description )
AS SELECT
          t.id
	, t.category
	, t.description
FROM
	data.task t
WHERE
	NOT t.done;

\echo -- Creating JOURNAL view

CREATE VIEW journal
        ( id
	, done
	, priority
	, category
	, description
	, effort
	, estimative
	, started_at
	, started_on )
AS SELECT
          t.id
	, t.done
	, t.priority
	, t.category
	, t.description
	, t.effort
	, t.estimative
	, t.started_at
	, t.started_on
FROM
	data.task t
WHERE
	t.started_at IS NOT NULL;

\echo -- Changing SEARCH_PATH to DEFAULT

SET LOCAL search_path TO default;
