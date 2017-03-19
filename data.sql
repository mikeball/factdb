
-- it seems like we have
--   stand alone entities
--   properties that are list of potential text values


-- app schema load
insert into properties (type, name) values
                       ('text', 'job/name'), -- pid == 1

                       ('text', 'person/name'), -- pid == 2
                       ('int',  'person/age'),  -- pid == 3
                       ('ref',  'person/job'),  -- pid == 4 -- a relationship property type??

                       ('text', 'shirt/color'); -- pid == 5
                       



-- create job type entities
insert into transactions (meta) values ('adding both jobs'); -- 6

insert into entities (type, meta) values ('job', 'game show host entity'); -- 7
select assert_fact(6, 7, 1, 'Game Show Host'); -- 9

insert into entities (type, meta) values ('job', 'politician entity'); -- 10
select assert_fact(6, 10, 1, 'Politician'); -- 12


-- assert(_tid integer, _eid integer, _pid integer, _value)


-- create bob
insert into transactions (meta) values ('adding bob'); -- 13
insert into entities (type, meta) values ('person', 'bob entity'); -- 14

select assert_fact(13, 14, 2, 'Bob Barker'); -- 16 bob's first name
select assert_fact(13, 14, 3, 92); -- 18 bob's age
select assert_fact(13, 14, 4, 7); -- 20 game show host
select assert_fact(13, 14, 5, 'green'); -- 22 bob's shirt color



-- create bernie
insert into transactions (meta) values ('adding bernie'); -- 23
insert into entities (type, meta) values ('person', 'bernie entity'); -- 24

select assert_fact(21, 24, 2, 'Bernie Sanders'); -- 26 first name
select assert_fact(21, 24, 3, 74); -- 28 age
select assert_fact(21, 24, 4, 10); -- 30 politician
select assert_fact(21, 24, 5, 'blue'); -- 32 shirt/color



/*
-- _tid integer, _eid integer, _pid integer, _value

-- the next day, bob wears a different shirt...
insert into transactions (meta) values ('bob wears a different shirt'); -- 20
select assert_fact(20, 5, 2, 'orange');


*/


/*

-- retract bill shirt color, we were incorrect
insert into transactions (meta) values ('remove bills shirt/color');
select retract_fact(4, 2, 2);



-- retract bill altogether
insert into transactions (meta) values ('remove bill from db');
select retract_entity(5, 2);

*/


