\c knowledge_repo;

SELECT 'CREATE USER knowledge_repo'
WHERE NOT EXISTS (SELECT FROM pg_user WHERE usename = 'knowledge_repo')\gexec

SELECT 'CREATE DATABASE knowledge_repo'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'knowledge_repo')\gexec

ALTER USER knowledge_repo WITH PASSWORD 'knowledge_repo';

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
SET search_path = public;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
