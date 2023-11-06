CREATE TABLE "queries" (
    "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
    "name" varchar NOT NULL,
    "query" varchar NOT NULL
);

INSERT INTO "queries" (name, query)
VALUES (
    'all_accounts',
    'SELECT * FROM accounts'
);

INSERT INTO "queries" (name, query)
VALUES (
    'all_persons',
    'SELECT * FROM persons'
);