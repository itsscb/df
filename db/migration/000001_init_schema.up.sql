CREATE TABLE "mails" (
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "from" varchar NOT NULL,
  "to" varchar NOT NULL,
  "cc" varchar,
  "timestamp" timestamptz NOT NULL DEFAULT (now()),
  "subject" varchar NOT NULL,
  "body" text NOT NULL,
  "attachments" integer
);

CREATE TABLE "customers" (
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "username" varchar UNIQUE NOT NULL,
  "passwordhash" varchar NOT NULL,
  "firstname" varchar NOT NULL,
  "lastname" varchar NOT NULL,
  "birthday" timestamptz NOT NULL,
  "privacyAccepted" boolean NOT NULL DEFAULT false,
  "privacyAcceptedDate" timestamptz,
  "email" varchar UNIQUE NOT NULL,
  "phone" varchar,
  "city" varchar NOT NULL,
  "zip" varchar NOT NULL,
  "street" varchar NOT NULL,
  "country" varchar NOT NULL,
  "token" varchar,
  "tokenValid" boolean DEFAULT false,
  "tokenExpiration" timestamptz NOT NULL DEFAULT (now()),
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "persons" (
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "customerID" bigserial NOT NULL,
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
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "personID" bigserial NOT NULL,
  "name" varchar NOT NULL,
  "type" varchar NOT NULL,
  "path" varchar NOT NULL,
  "url" varchar NOT NULL,
  "valid" boolean NOT NULL DEFAULT false,
  "validDate" timestamptz,
  "validatedBy" varchar,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "payments" (
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "customerID" bigserial NOT NULL,
  "paymentCategory" varchar NOT NULL,
  "bankname" varchar,
  "IBAN" varchar,
  "BIC" varchar,
  "paypalAccount" varchar,
  "paypalID" varchar,
  "paymentSystem" varchar,
  "type" varchar NOT NULL,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

CREATE TABLE "providers" (
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
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
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "personID" bigserial NOT NULL,
  "providerID" bigserial NOT NULL,
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
  "ID" bigserial UNIQUE PRIMARY KEY NOT NULL,
  "returnsID" bigserial,
  "mailID" bigserial,
  "status" varchar,
  "creator" varchar NOT NULL,
  "created" timestamptz NOT NULL DEFAULT (now()),
  "changer" varchar NOT NULL,
  "changed" timestamptz NOT NULL DEFAULT (now())
);

ALTER TABLE "mails" ADD FOREIGN KEY ("attachments") REFERENCES "documents" ("ID");

ALTER TABLE "persons" ADD FOREIGN KEY ("customerID") REFERENCES "customers" ("ID");

ALTER TABLE "documents" ADD FOREIGN KEY ("personID") REFERENCES "persons" ("ID");

ALTER TABLE "payments" ADD FOREIGN KEY ("customerID") REFERENCES "customers" ("ID");

ALTER TABLE "returns" ADD FOREIGN KEY ("personID") REFERENCES "persons" ("ID");

ALTER TABLE "returns" ADD FOREIGN KEY ("providerID") REFERENCES "providers" ("ID");

ALTER TABLE "returnsLog" ADD FOREIGN KEY ("returnsID") REFERENCES "returns" ("ID");

ALTER TABLE "returnsLog" ADD FOREIGN KEY ("mailID") REFERENCES "mails" ("ID");
