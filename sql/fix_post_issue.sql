\c knowledge_repo;

DO $$
BEGIN
WHILE NOT EXISTS (
    SELECT FROM 
        pg_tables
    WHERE 
        schemaname = 'public' AND 
        tablename  = 'posts'
    ) 
LOOP
    raise notice 'Waiting...';
    PERFORM pg_sleep(1);
END LOOP;
END$$;

ALTER TABLE posts ALTER private TYPE bool USING 
  CASE WHEN private=0 THEN FALSE 
  ELSE TRUE 
END;
