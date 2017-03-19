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
