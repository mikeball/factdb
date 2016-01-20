


-- Assert a fact
-- [:assert {:eid 11 :pid 2 :value "blue"}]
-- drop function assert_fact(integer,integer,integer,text);
CREATE OR REPLACE FUNCTION assert_fact(_tid integer, _eid integer, _pid integer, _value text)
    RETURNS BOOLEAN AS $$ BEGIN

-- check if fact is different from current fact, if not no assertion necessary...?
IF EXISTS (SELECT 1 FROM current_facts_text WHERE eid = _eid and pid = _pid and value = _value) THEN
  return false;
END IF;

insert into facts_text (tid, eid, pid, value) values(_tid, _eid, _pid, _value);
delete from current_facts where eid = _eid and pid = _pid;
insert into current_facts_text (eid, pid, value) values(_eid, _pid, _value);

return true;

END; $$ LANGUAGE 'plpgsql';




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





-- Retract a single fact
-- [:retract {:eid 11 :pid 2}]
CREATE OR REPLACE FUNCTION retract_fact(_tid integer, _eid integer, _pid integer)
    RETURNS BOOLEAN AS $$ BEGIN

-- if current fact does not exist, no retraction necessary??
IF NOT EXISTS (SELECT 1 FROM current_facts WHERE eid = _eid and pid = _pid ) THEN
  return false;
END IF;

insert into retractions (tid, eid, pid) values(_tid, _eid, _pid);
delete from current_facts where eid = _eid and pid = _pid;

return true;

END; $$ LANGUAGE 'plpgsql';




-- Retract an entire entity
CREATE OR REPLACE FUNCTION retract_entity(_tid integer, _eid integer)
    RETURNS BOOLEAN AS $$ BEGIN

-- if current entity does not exist, no retraction necessary.
IF NOT EXISTS (SELECT 1 FROM current_facts WHERE eid = _eid) THEN
  return false;
END IF;

-- record removal of all properties of this entity
insert into retractions (tid, eid, pid)
  select _tid, _eid, pid from current_facts where eid = _eid;

delete from current_facts where eid = _eid;

return true;

END; $$ LANGUAGE 'plpgsql';

















--
