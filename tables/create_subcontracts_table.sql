--Sequence : subcontract_id_gen

CREATE SEQUENCE subcontract_id_gen;
ALTER SEQUENCE subcontract_id_gen RESTART WITH 100;


-- Table: public.subcontracts
-- DROP TABLE IF EXISTS public.subcontracts;

-- Table: public.subcontracts

-- DROP TABLE public.subcontracts;

CREATE TABLE public.subcontracts
(
    subcontract_id integer NOT NULL DEFAULT nextval('subcontract_id_gen'::regclass),
    parent_id integer NOT NULL,
    exporter_account_id integer NOT NULL,
    remittance_value integer NOT NULL,
    judge_vote character(255) COLLATE pg_catalog."default",
    date timestamp without time zone NOT NULL,
    status character(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT subcontract_pkey PRIMARY KEY (subcontract_id),
    CONSTRAINT exporter_account_id FOREIGN KEY (exporter_account_id)
        REFERENCES public.accounts (account_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT parent_id FOREIGN KEY (parent_id)
        REFERENCES public.contracts (contract_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.subcontracts
    OWNER to admin;


-- Index: fki_exporter_id

-- DROP INDEX public.fki_exporter_id;

CREATE INDEX fki_exporter_id
    ON public.subcontracts USING btree
    (exporter_account_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: fki_parent_id

-- DROP INDEX public.fki_parent_id;

CREATE INDEX fki_parent_id
    ON public.subcontracts USING btree
    (parent_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: pki_subcontract_id

-- DROP INDEX public.pki_subcontract_id;

CREATE UNIQUE INDEX pki_subcontract_id
    ON public.subcontracts USING btree
    (subcontract_id ASC NULLS LAST)
    TABLESPACE pg_default;
