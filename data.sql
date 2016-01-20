
-- app schema load
insert into properties (type, name) values
                       ('text', 'person/name'), -- pid == 1
                       ('text', 'shirt/color'); -- pid == 2


-- let's create a person bob
insert into transactions (meta) values ('add bob'); -- 3
insert into entities (meta) values ('bob'); -- 4
select assert_fact(3, 4, 1, 'Bob');
select assert_fact(3, 4, 2, 'blue');


-- _tid integer, _eid integer, _pid integer, _value

/* 
-- the next day, bob wears a different shirt...
insert into transactions (meta) values ('bob wears a different shirt');
select assert_fact(2, 1, 2, 'orange');


-- create bill with a green shirt...
insert into transactions (meta) values ('add bill');
insert into entities (meta) values ('bill');
select assert_fact(3, 2, 1, 'Bill');
select assert_fact(3, 2, 2, 'green');


-- retract bill shirt color, we were incorrect
insert into transactions (meta) values ('remove bills shirt/color');
select retract_fact(4, 2, 2);



-- retract bill altogether
insert into transactions (meta) values ('remove bill from db');
select retract_entity(5, 2);

*/


