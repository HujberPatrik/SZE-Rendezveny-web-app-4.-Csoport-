CREATE DATABASE "RendezvenyApp"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'hu-HU'
    LC_CTYPE = 'hu-HU'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

CREATE TABLE IF NOT EXISTS public."statusz"
(
    "id" integer NOT NULL,
    "statusz" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "statusz_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."statusz"
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public."kerveny"
(
    "id" integer NOT NULL,
    "nev" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "statusz" integer NOT NULL,
    "datum" date NOT NULL,
    "helyszin" character varying(20) COLLATE pg_catalog."default" NOT NULL,
    "letszam" integer NOT NULL,
    "email" character varying(30) COLLATE pg_catalog."default" NOT NULL,
    "telefonszam" character varying(12) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "kerveny_pkey" PRIMARY KEY ("id"),
    CONSTRAINT "statuszFk" FOREIGN KEY ("statusz")
        REFERENCES public."statusz" ("id") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."kerveny"
    OWNER to postgres;