

select f.eid, f.pid, p.name, f.value
  from current_facts f
    inner join properties p on f.pid = p.pid
  where f.eid = 1;
