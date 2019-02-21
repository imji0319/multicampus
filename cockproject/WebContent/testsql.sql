select * from cocktail

select * from membertable;


create table basketorder ( cock_id number(5), 
							ordertime date);
							
select * from BASKETORDER;

select cock_id from basketorder;

delete basketorder;


create table membertable (
	name varchar2(100),
	phone varchar2(100),
	choice number(5),
	order_date date
)


select * from basketorder;


select * from membertable;

delete from membertable where choice IS NOT NULL;
