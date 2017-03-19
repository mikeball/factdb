
-- table parameters? A table for text, a table for int?
-- http://dba.stackexchange.com/questions/35565/how-to-pass-a-table-type-with-an-array-field-to-a-function-in-postgresql

-- driver could cache the property ids, etc... and only send ints back
-- so that postgres doesn't need to lookup every time.



-- find all entities matchine this pid and value
CREATE OR REPLACE FUNCTION find_text_matches(_pid bigint, _value text)
    RETURNS TABLE (eid bigint) AS $$ 
BEGIN


RETURN QUERY
select cf.eid
  from current_facts_text cf
  where cf.pid = _pid
    and cf.value = _value;


END
$$ LANGUAGE 'plpgsql';



