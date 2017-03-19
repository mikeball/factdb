-- select a list of people

-- let's select a list of people
-- option 1: so I can "assume that people" have a 'person/name' property?
-- option 2: entities should have a type?


-- then can select the facts
/* where entity/type = 'person'
     and shirt/color = 'green'
     select * 
*/

-- first must find list of entities with a shirt color
select cf.eid
  from current_facts_text cf
    inner join properties p on cf.pid = p.pid
  where p.name = 'shirt/color' 
    and cf.value = 'green'
;



-- select text facts
select cf.eid, cf.pid, p.name, cf.value
  from current_facts_text cf
    inner join properties p on cf.pid = p.pid
    inner join entities e on cf.eid = e.eid
  where e.type = 'person'
    and e.eid in(14)
  order by cf.eid
;


--  select the int facts
select cf.eid, cf.pid, p.name, cf.value
  from current_facts_int cf
    inner join properties p on cf.pid = p.pid
    inner join entities e on cf.eid = e.eid
  where e.type = 'person'
    and e.eid in(14)
  order by cf.eid
;




