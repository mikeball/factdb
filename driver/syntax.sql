### Syntax Ideas ###

where entity/id = 111
    select1 person/name, shirt/color

where shirt/color = `blue`
    select entity/id, person/name


from person
  where shirt/color = `blue`
  select entity/id, person/name

/* The from syntax implies that entities have a type or class(aka tables).
   Not sure if this is good or bad? */

where shirt/color == `blue` and
      entity/type == 'person'
    select entity/id, person/name

-- so entity/id and entity/type are system properties


-- MUST have a way to specify point in time for queries
from person
  where shirt/color = `blue`
  select entity/id, person/name
  asof '2018-06-15'


/* probably should have a notion of multiple timelines
   domain time and system time */
from person
  where shirt/color = `blue`
  select entity/id, person/name
  asof-systime '2018-06-15'




select shirt/color, (count entity/id)


-- How would we assert facts?
on id=101 assert
    person/name = `bob`,
    shirt/color = `blue`

--  assert a new user and roles
on new assert
    user/name = `bob`,
    user/roles = [11 22]

--  assert a new user and roles and specify the entity type?
on new person assert
    user/name = `bob`


/* do we need to be able to specify domain time 
   for assertations? If there's a fact that we now know,
   but which was in existance or true at some earlier point. */
on id=101 assert
    person/name = `bob`,
    shirt/color = `blue`
    asof '2018-06-15' 




/* upsert syntax?
   Is upsert even necessary because at the core if you state a fact that is
   the same as it presently is, shouldn't it just be ignored?
   probably need a re-assert statement */
on id=101 else new assert
    user/name = `bob`





-- How to retract a fact
on id = 101 retract
    person/name, shirt/color



-- How to forget a fact
on id = 101 forget 
            person/name


