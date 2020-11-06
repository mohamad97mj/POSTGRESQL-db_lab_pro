--Sequence : transaction_id_gen

CREATE SEQUENCE transaction_id_gen;
ALTER SEQUENCE transaction_id_gen RESTART WITH 100000;

-- Table: public.transactions

-- DROP TABLE IF EXISTS public.transactions;

CREATE TABLE public.transactions
(
    transaction_id integer NOT NULL DEFAULT nextval('transaction_id_gen'),
    amount integer NOT NULL,
    src_account_id integer NOT NULL,
    dst_account_id integer NOT NULL,
    date timestamp without time zone NOT NULL,
    CONSTRAINT transactions_pkey PRIMARY KEY (transaction_id),
    CONSTRAINT dst_account_id FOREIGN KEY (dst_account_id)
        REFERENCES public.accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT src_account_id FOREIGN KEY (src_account_id)
        REFERENCES public.accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE public.transactions
    OWNER to postgres;
-- Index: fki_dst_account_id

-- DROP INDEX public.fki_dst_account_id;

CREATE INDEX fki_dst_account_id
    ON public.transactions USING btree
    (dst_account_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_src_account_id

-- DROP INDEX public.fki_src_account_id;

CREATE INDEX fki_src_account_id
    ON public.transactions USING btree
    (src_account_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: pki_transaction_id

-- DROP INDEX public.pki_transaction_id;

CREATE UNIQUE INDEX pki_transaction_id
    ON public.transactions USING btree
    (transaction_id ASC NULLS LAST)
    TABLESPACE pg_default;
