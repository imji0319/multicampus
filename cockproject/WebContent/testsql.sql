select * from cocktail

select * from membertable;


create table basketorder ( cock_id number(5), 
							ordertime date);
							
select * from BASKETORDER;

select cock_id from basketorder;

delete basketorder;

drop table membertable;

create table membertable (
	name varchar(100),
	phone varchar(100),
	choice number(5),
	order_date date
)


select * from MEMBERTABLE
