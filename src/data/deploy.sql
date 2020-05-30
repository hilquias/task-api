\echo -- Creating DATA schema

CREATE SCHEMA data;

\echo -- Changing SEARCH_PATH to DATA

SET LOCAL search_path TO data;

\echo -- Creating TASK table

CREATE TABLE task
	( id serial PRIMARY KEY
	, done boolean NOT NULL DEFAULT FALSE
	, priority integer NULL CHECK (priority >= 0 AND priority <= 100)
	, category text NOT NULL CHECK (category <> '')
	, description text NOT NULL CHECK (description <> '')
	, effort integer NOT NULL DEFAULT 0 CHECK (effort >= 0)
	, estimative integer NOT NULL DEFAULT 0 CHECK (estimative >= 0)
	, started_at date NULL CHECK (NOT done OR started_at IS NOT NULL)
	, started_on time NULL CHECK (NOT done OR started_on IS NOT NULL)
	);

\echo -- Changing SEARCH_PATH to DEFAULT

SET LOCAL search_path TO default;
