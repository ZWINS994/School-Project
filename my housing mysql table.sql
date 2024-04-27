create database Housing;
use housing;


create table state(state_id varchar(2) PRIMARY KEY,
state_name varchar(255) not null);

create table lease(
lease_id int primary key,
start_date date not null,
end_date date not null,
lease_amount decimal(10,3) not null,
security_deposit decimal(10,2) not null,
tenant_id int,
landlord_id int
);

#i have to come back and create all the foreign keys after the tables have been created using the alter table to avoid errors

create table landlord(
landlord_id int primary key,
landlord_name varchar(255) not null,
contact_info varchar(255) not null
);

create table tenant(
tenant_id int primary key,
tenant_name varchar(255) not null,
contact_info varchar(255) not null,
lease_start_date date not null,
lease_end_date date not null
);

create table property(
property_id int primary key,
decsription varchar(255) not null,
rent decimal (10,2) not null,
size int not null,
address varchar(255) not null,
state_id varchar(2),
lease_id int unique
);

create table pet(
pet_id int primary key,
pet_name varchar(255)not null,
species varchar (255) not null,
bread varchar(255) not null,
property_id int
);

create table payment (
payment_id int primary key,
amount decimal(10,2) not null,
payement_date date not null,
lease_id int,
tenant_id int
);

alter table payment add constraint lease_id foreign key(lease_id) references lease(lease_id);
alter table payment add constraint lease_id foreign key(lease_id) references lease(lease_id);

insert into state(state_id, state_name) values ('ÇA', 'California');

insert into Lease(lease_id, start_date, end_date, lease_amount, security_deposit, tenant_id, landlord_id)
value(1, '2024-03-01', '2025-03-01', 1200.00, 1500.00, 1,1);

insert into tenant(tenant_id, tenant_name, contact_info, lease_start_date, lease_end_date)
values(1, 'jane', 'jane', '2025-03-01', '2025-03-01');

insert into landlord(landlord_id, landlord_name, contact_info)
values(1, 'john', 'john');

insert into property(property_id, decsription, rent, size, address, state_id, lease_id)
values (1, 'cozy appartment', 1000.00, 800, '123 mssune ', 'CA', 1);

insert into pet (pet_id, pet_name, species, bread, property_id)
values(1, 'fluffy', 'cat', 'persian', 1);


#question ii
select decsription from property where rent <=100 and property_id in (select property_id from pet where bread = 'cat')
and state_id = 'CA';

#question iii

select state_id, avg(rent) as Average_rent from property group by state_id;