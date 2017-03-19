

select cft.eid, cft.pid, p.name, cft.value
  from current_facts_text cft
    inner join properties p on cft.pid = p.pid
  -- where cft.eid = 1;
