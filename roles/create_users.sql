DROP ROLE IF EXISTS mohammad; 
CREATE USER mohammad WITH PASSWORD 'mohammad';
GRANT importer TO mohammad;

DROP ROLE IF EXISTS mostafa;
CREATE USER mostafa WITH PASSWORD 'mostafa';
GRANT exchanger TO mostafa;

DROP ROLE IF EXISTS reza;
CREATE USER reza WITH PASSWORD 'reza';
GRANT exporter TO reza;

DROP ROLE IF EXISTS ali;
CREATE USER ali WITH PASSWORD 'ali';
GRANT exporter TO ali;

DROP ROLE IF EXISTS amirkabir;
CREATE USER amirkabir WITH PASSWORD 'amirkabir';
GRANT judge TO amirkabir;

DROP ROLE IF EXISTS kalagh;
CREATE USER kalagh WITH PASSWORD 'kalagh';
GRANT reporter TO kalagh;



