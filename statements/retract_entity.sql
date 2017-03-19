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

