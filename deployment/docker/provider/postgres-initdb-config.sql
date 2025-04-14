CREATE USER catalog_server WITH ENCRYPTED PASSWORD 'catalog_server' SUPERUSER;
CREATE DATABASE catalog_server;

CREATE USER qna WITH ENCRYPTED PASSWORD 'provider-qna' SUPERUSER;
CREATE DATABASE provider_qna;

CREATE USER manufacturing WITH ENCRYPTED PASSWORD 'provider-manufacturing' SUPERUSER;
CREATE DATABASE provider_manufacturing;

CREATE USER identity WITH ENCRYPTED PASSWORD 'identity' SUPERUSER;
CREATE DATABASE identity;

CREATE DATABASE dummydb;
CREATE USER dummyuser WITH ENCRYPTED PASSWORD 'dummy-user';
GRANT CONNECT ON DATABASE dummydb TO dummyuser;
\c dummydb
GRANT USAGE ON SCHEMA public TO dummyuser;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO dummyuser;
ALTER DEFAULT PRIVILEGES IN SCHEMA public
GRANT SELECT ON TABLES TO dummyuser;

CREATE TABLE measurement (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    value NUMERIC
);

INSERT INTO measurement (value) VALUES (12.4);
INSERT INTO measurement (value) VALUES (36.8);
INSERT INTO measurement (value) VALUES (7.9);
INSERT INTO measurement (value) VALUES (54.2);
INSERT INTO measurement (value) VALUES (29.1);
INSERT INTO measurement (value) VALUES (63.3);
INSERT INTO measurement (value) VALUES (45.6);
INSERT INTO measurement (value) VALUES (11.0);
INSERT INTO measurement (value) VALUES (88.8);
INSERT INTO measurement (value) VALUES (101.5);
INSERT INTO measurement (value) VALUES (0.2);
INSERT INTO measurement (value) VALUES (77.7);
INSERT INTO measurement (value) VALUES (34.4);
INSERT INTO measurement (value) VALUES (66.6);
INSERT INTO measurement (value) VALUES (25.9);
INSERT INTO measurement (value) VALUES (90.0);
INSERT INTO measurement (value) VALUES (13.3);
INSERT INTO measurement (value) VALUES (72.1);
INSERT INTO measurement (value) VALUES (39.9);
INSERT INTO measurement (value) VALUES (58.2);