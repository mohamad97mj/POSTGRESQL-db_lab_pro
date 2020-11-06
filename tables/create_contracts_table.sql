--Sequence : contract_id_gen

CREATE SEQUENCE contract_id_gen;
ALTER SEQUENCE contract_id_gen RESTART WITH 10;

-- Table: public.contracts

-- DROP TABLE public.contracts;

CREATE TABLE public.contracts
(
    contract_id integer NOT NULL DEFAULT nextval('contract_id_gen'::regclass),
    importer_account_id integer NOT NULL,
    exchanger_account_id integer NOT NULL,
    judge_id integer NOT NULL,
    remittance_value integer NOT NULL,
    judge_vote character(255) COLLATE pg_catalog."default",
    date timestamp without time zone NOT NULL,
    status character(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT contract_pkey PRIMARY KEY (contract_id),
    CONSTRAINT exchanger_account_id FOREIGN KEY (exchanger_account_id)
        REFERENCES public.accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT importer_account_id FOREIGN KEY (importer_account_id)
        REFERENCES public.accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT judge_id FOREIGN KEY (judge_id)
        REFERENCES public.users (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.contracts
    OWNER to admin;


-- Index: fki_exchanger_id

-- DROP INDEX public.fki_exchanger_id;

CREATE INDEX fki_exchanger_id
    ON public.contracts USING btree
    (exchanger_account_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_importer_id

-- DROP INDEX public.fki_importer_id;

CREATE INDEX fki_importer_id
    ON public.contracts USING btree
    (importer_account_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_judge_id

-- DROP INDEX public.fki_judge_id;

CREATE INDEX fki_judge_id
    ON public.contracts USING btree
    (judge_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: pki_contract_id

-- DROP INDEX public.pki_contract_id;

CREATE UNIQUE INDEX pki_contract_id
    ON public.contracts USING btree
    (contract_id ASC NULLS LAST)
    TABLESPACE pg_default;
