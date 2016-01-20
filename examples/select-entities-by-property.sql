-- select all entities that have a shirt color orange
-- should we pass pid or full property name?

with matches as (
  select distinct eid
    from current_facts
    where pid = 2 and value = 'orange'
)


-- limit select to list of properties in query field list?

select f.eid, p.name, f.value
  from current_facts f
    inner join matches m on m.eid = f.eid
    inner join properties p on f.pid = p.pid
  order by f.eid -- order by is critical for callers to properly read results...
