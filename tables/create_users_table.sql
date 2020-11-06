-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE public.users
(
    user_id integer NOT NULL,
    type character(255) COLLATE pg_catalog."default" NOT NULL,
    name character(255),
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to admin;
-- Index: pki_user_id

-- DROP INDEX public.pki_user_id;

CREATE UNIQUE INDEX pki_user_id
    ON public.users USING btree
    (user_id ASC NULLS LAST)
    TABLESPACE pg_default;
    
