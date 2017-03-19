

-- union all matches from text/int?


-- first must find list of matching entities
with matching_entities as (
    select cf.eid
      from current_facts_text cf
        inner join properties p on cf.pid = p.pid
      where p.name = 'shirt/color' 
        and cf.value = 'green'
)


-- select full text facts
select cf.eid, cf.pid, p.name, cf.value
  from current_facts_text cf
    inner join properties p on cf.pid = p.pid
    inner join entities e on cf.eid = e.eid
    inner join matching_entities me on cf.eid = me.eid
  where e.type = 'person'
  order by cf.eid




-- return matches as a result set?
-- http://stackoverflow.com/questions/7945932/how-to-return-result-of-a-select-inside-a-function-in-postgresql
