\c postgres
DROP DATABASE IF EXISTS pro;

--ROLE: admin

DROP ROLE IF EXISTS admin;
CREATE USER admin SUPERUSER;
ALTER ROLE admin WITH PASSWORD 'admin';    


-- Database: pro

CREATE DATABASE pro
    WITH 
    OWNER = admin
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

       
-- Connect To Database pro as admin       
\c pro admin 127.0.0.1 5432

SET ROLE admin;
