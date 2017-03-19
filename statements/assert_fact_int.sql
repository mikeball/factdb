-- Assert an integer fact

CREATE OR REPLACE FUNCTION assert_fact(_tid integer, _eid integer, _pid integer, _value int)
    RETURNS BOOLEAN AS $$ BEGIN

-- check if fact is different from current fact, if not no assertion necessary...?
IF EXISTS (SELECT 1 FROM current_facts_int WHERE eid = _eid and pid = _pid and value = _value) THEN
  return false;
END IF;

insert into facts_int (tid, eid, pid, value) values(_tid, _eid, _pid, _value);
delete from current_facts where eid = _eid and pid = _pid;
insert into current_facts_int (eid, pid, value) values(_eid, _pid, _value);

return true;

END; $$ LANGUAGE 'plpgsql';
