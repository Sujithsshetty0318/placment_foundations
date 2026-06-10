create database `nitte2026`;
use nitte2026;
create table creditcard(
card_no bigint not null primary key,
card_holder varchar(255) not null,
card_limit int not null,card_status varchar(255) default 'active');
describe creditcard;
create table merchant(
merchant_id int not null primary key, 
merchant_name varchar(255) not null,
merchant_account bigint not null
);
describe merchant;
create table transactions(
	t_id bigint not null primary key auto_increment,
    t_date date not null, t_amount double not null,
    t_by bigint not null, t_to int not null, 
    foreign key(t_by) references creditcard(card_no),
    foreign key(t_to) references merchant(merchant_id)
);
describe transactions;

insert into creditcard values(87656765665654,'Razak Mohamed',120000,'active');
insert into creditcard values(45678567834444,'Prem Kumar',80000,'active');
insert into creditcard values(98765456765653,'Patrick',25000,'closed');

insert into merchant values(1234,'Arun',8765677656455);
insert into merchant values(4755,'Sridhar',9876567876784);
insert into merchant values(9893,'Venkat',567546466464646);

insert into transactions values(20260624,now(),7800.4,45678567834444,1234);
insert into transactions values(20260629,now(),25.0,87656765665654,9893);
insert into transactions values(20251021,now(),450000.8,98765456765653,4755);
insert into transactions values(20260110,now(),200.5,87656765665654,1234);

select * from transactions;

select * from creditcard where card_no=98765456765653;
select * from transactions where t_by=87656765665654;

select * from transactions inner join merchant on merchant.merchant_id=transactions.t_to where t_by=87656765665654;
select t_amount,t_date,merchant.merchant_name from transactions inner join merchant on merchant.merchant_id=transactions.t_to where t_by=87656765665654;
-- inner join: matching values in both tables
select t_amount, creditcard.card_holder, t_date from 
transactions inner join creditcard 
on t_by=creditcard.card_no;

-- DML: deleting records
delete from transactions where t_by=45678567834444;

-- Left join: return all rows from left  
-- and matching rows from right , 
-- it returns null if no match in the right
select card_holder,transactions.t_date,t_amount 
from creditcard left join 
transactions on card_no=transactions.t_by;

delete from transactions where t_to=1234;

-- right join: returns all rows from right,
 -- and matching rows from left
 
select merchant_name, t_amount 
from transactions right join merchant
on t_to = merchant.merchant_id;


-- Full join: returns all rows when there 
-- is a match in either left or right
-- Note: not supoorted in MySQL
-- Union of left and right

select card_holder,transactions.t_id, 
merchant.merchant_name, transactions.t_amount from 
creditcard left join transactions 
on card_no=transactions.t_by left join merchant 
on transactions.t_to=merchant.merchant_id
union
select card_holder,transactions.t_id, 
merchant.merchant_name, transactions.t_amount from 
creditcard right join transactions 
on card_no=transactions.t_by right join merchant 
on transactions.t_to=merchant.merchant_id;

insert into transactions values(765678,now(),1200.4,45678567834444,1234);
insert into transactions values(456789,now(),450000.8,98765456765653,4755);

-- aggregate functions: sum, max, avg
-- sum
select creditcard.card_holder, sum(t_amount ) 
as spent from transactions join creditcard 
on t_by=creditcard.card_no 
group by creditcard.card_holder;

-- average
select merchant.merchant_name, avg(t_amount)  as 
AverageIncome from transactions join merchant 
on t_to = merchant.merchant_id 
group by merchant.merchant_name;

insert into transactions values(4567,now(),8700,45678567834444,4755);
insert into transactions values(56789,now(),13400,98765456765653,1234);

-- max
select creditcard.card_holder, max(t_amount) as 
max_spent from transactions join creditcard 
on t_by=creditcard.card_no 
group by creditcard.card_holder;

-- count
select merchant_name, count(t_id) as 
bills from merchant left join transactions 
on merchant_id=transactions.t_to 
group by merchant_name;


-- create users
create user 'head' identified by 'manage123';
create user 'holder' identified by 'custom123';
create user 'executive' identified by 'exec123';

show grants;

-- DCL: grant and revoke

grant update, select on creditcard to 'executive';

show grants;
revoke update on creditcard from executive;

flush privileges;