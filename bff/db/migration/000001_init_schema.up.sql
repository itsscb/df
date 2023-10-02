CREATE TABLE "mails" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "from" varchar NOT NULL,
  "to" varchar[] NOT NULL,
  "cc" varchar[],
  "timestamp" timestamptz NOT NULL DEFAULT (now()),
  "subject" varchar NOT NULL,
  "body" text NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "accounts" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "permission_level" int NOT NULL DEFAULT 0,
  "passwordhash" varchar NOT NULL,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "birthday" timestamptz NOT NULL,
  "privacy_accepted" boolean DEFAULT false,
  "privacy_accepted_date" timestamptz,
  "email" varchar UNIQUE NOT NULL,
  "phone" varchar,
  "city" varchar NOT NULL,
  "zip" varchar NOT NULL,
  "street" varchar NOT NULL,
  "country" varchar NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "sessions" (
  "id" uuid UNIQUE PRIMARY KEY NOT NULL,
  "email" varchar NOT NULL,
  "user_agent" varchar NOT NULL,
  "client_ip" varchar NOT NULL,
  "refresh_token" varchar NOT NULL,
  "is_blocked" boolean NOT NULL DEFAULT false,
  "expires_at" timestamptz NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "persons" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "account_id" bigint NOT NULL,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "birthday" timestamptz NOT NULL,
  "city" varchar NOT NULL,
  "zip" varchar NOT NULL,
  "street" varchar NOT NULL,
  "country" varchar NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "documents" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "person_id" bigint,
  "name" varchar NOT NULL,
  "type" varchar NOT NULL,
  "path" varchar NOT NULL,
  "url" varchar NOT NULL,
  "valid" boolean NOT NULL DEFAULT false,
  "valid_date" timestamptz,
  "validated_by" varchar,
  "mail_id" bigint,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "payments" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "account_id" bigint NOT NULL,
  "payment_category" varchar NOT NULL,
  "bankname" varchar,
  "IBAN" varchar,
  "BIC" varchar,
  "paypal_account" varchar,
  "paypal_id" varchar,
  "payment_system" varchar,
  "type" varchar NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "providers" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "category" varchar NOT NULL,
  "email" varchar NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "returns" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "person_id" bigint NOT NULL,
  "provider_id" bigint NOT NULL,
  "name" varchar NOT NULL,
  "description" text NOT NULL,
  "category" varchar NOT NULL,
  "email" varchar NOT NULL,
  "status" varchar NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "returnsLog" (
  "id" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "return_id" bigint NOT NULL,
  "mail_id" bigint NOT NULL,
  "status" varchar,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "sessions" ADD FOREIGN KEY ("email") REFERENCES "accounts" ("email");

ALTER TABLE "persons" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "documents" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "documents" ADD FOREIGN KEY ("mail_id") REFERENCES "mails" ("id");

ALTER TABLE "payments" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "returns" ADD FOREIGN KEY ("person_id") REFERENCES "persons" ("id");

ALTER TABLE "returns" ADD FOREIGN KEY ("provider_id") REFERENCES "providers" ("id");

ALTER TABLE "returnsLog" ADD FOREIGN KEY ("return_id") REFERENCES "returns" ("id");

ALTER TABLE "returnsLog" ADD FOREIGN KEY ("mail_id") REFERENCES "mails" ("id");
