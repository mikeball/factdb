-- postgresql build script!
/* CREATE DATABASE myfacts_db;
   CREATE USER myfacts_app WITH PASSWORD 'dev'; */

drop table current_facts_int;
drop table current_facts_text;
drop table current_facts;

drop table retractions;

drop table facts_int;
drop table facts_text;
drop table facts;

drop table entities;
drop table transactions;
drop table properties;
drop sequence serial;

CREATE SEQUENCE serial START 1;


create table properties ( -- should this be called attributes?
    pid bigint DEFAULT nextval('serial') primary key not null,
    type text not null,

    -- should the property namespace be an entity type?
    -- rather than being a prefix portion of a string?
    -- entity_type_id int not null?
    -- or perhaps called context? namespace?
    name text not null
);

-- do we need an entity_types table?

create table entities (
    eid bigint DEFAULT nextval('serial') primary key not null,
    type text not null, -- potenially an array of names?
    meta text not null
);

create table transactions (
    tid bigint DEFAULT nextval('serial') primary key not null,
    -- system_time    when a fact was recorded
    -- domain_time    when a fact was actually known, created, or happened
    meta text not null
);

create table facts (
    fid bigint DEFAULT nextval('serial') primary key not null,
    tid bigint not null references transactions,
    eid bigint not null references entities,
    pid bigint not null references properties
);
create table facts_text (value text not null) inherits (facts);
create table facts_int (value int not null) inherits (facts);



create table retractions (
    rid bigint DEFAULT nextval('serial') primary key not null,
    tid bigint not null references transactions,
    eid bigint not null references entities,
    pid bigint not null references properties
);


-- removals? deletions? excisions?


create table current_facts (
    cfid bigint DEFAULT nextval('serial') primary key not null,
    eid bigint not null references entities,
    pid bigint not null references properties
);

create table current_facts_text ( value text not null ) inherits (current_facts);
create table current_facts_int ( value int not null ) inherits (current_facts);












--
