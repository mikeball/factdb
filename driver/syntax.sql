### Syntax Ideas ###

where entity/id = 111
    select1 person/name, shirt/color

where shirt/color = `blue`
    select entity/id, person/name


from person
  where shirt/color = `blue`
  select entity/id, person/name


select shirt/color, (count entity/id)


# How would we assert facts?

on id=101 assert
    person/name = `bob`,
    shirt/color = `blue`


# assert a new user and roles
on new assert
    user/name = `bob`,
    user/roles = [11 22]



# upsert syntax?
# Is upsert even necessary because at the core if you state a fact that is
# the same as it presently is, shouldn't it just be ignored?
# probably need a re-assert statement
on id=101 else new assert
    user/name = `bob`





# How to retract a fact?
on id = 101 retract
    person/name, shirt/color




# How to forget a fact? Perhaps delete is better term? Excision?
on id = 101 excise
  person/name

  on id = 101 forget
    person/name

  on id = 101 erase
    person/name

