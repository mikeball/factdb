

-- select * from properties; select * from entities; select * from transactions; select * from facts;




-- get the current state of an entity directly from facts...

/*

not going to use this but good example of using a window function

select distinct on (f.eid, f.pid)
    f.fid, f.eid, f.pid, f.tid,
    p.name,
    last_value(f.value) OVER wnd
  from facts f
    inner join properties p on f.pid = p.pid

  window wnd as (
    partition by f.eid,f.pid order by f.tid
    rows between unbounded preceding and unbounded following) */
