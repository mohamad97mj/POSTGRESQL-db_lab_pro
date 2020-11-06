-- Table: public.accounts

-- DROP TABLE IF EXISTS public.accounts;

CREATE TABLE public.accounts
(
    account_id integer NOT NULL,
    balance integer,
    type character(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT account_pkey PRIMARY KEY (account_id)
)

TABLESPACE pg_default;

ALTER TABLE public.accounts
    OWNER to admin;
-- Index: pki_account_id

-- DROP INDEX public.pki_account_id;

CREATE UNIQUE INDEX pki_account_id
    ON public.accounts USING btree
    (account_id ASC NULLS LAST)
    TABLESPACE pg_default;
