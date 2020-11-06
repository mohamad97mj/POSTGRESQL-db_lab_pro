-- Table: public.users_accounts

-- DROP TABLE IF EXISTS public.users_accounts;

CREATE TABLE public.users_accounts
(
    user_id integer NOT NULL,
    account_id integer NOT NULL,
    CONSTRAINT users_accounts_pkey PRIMARY KEY (account_id, user_id),
    CONSTRAINT account_id FOREIGN KEY (account_id)
        REFERENCES public.accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.users_accounts
    OWNER to admin;
-- Index: fki_account_id

-- DROP INDEX public.fki_account_id;

CREATE INDEX fki_account_id
    ON public.users_accounts USING btree
    (account_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_user_id

-- DROP INDEX public.fki_user_id;

CREATE INDEX fki_user_id
    ON public.users_accounts USING btree
    (user_id ASC NULLS LAST)
    TABLESPACE pg_default;
