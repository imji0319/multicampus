create table member( id varchar2(10),
					password number(12),
					name varchar2(30),
					phone varchar2(20),
					email varchar2(25),
					indate date);
					
select tname from tab;

alter table member add(sex varchar2(2));

alter table member modify(email number(3));

alter table member drop column sex;

drop table member;

create table member( id varchar2(10) constraint member_id_pk primary key,
					password number(12) constraint member_pw_nn not null,
					name varchar2(30),
					phone varchar2(20) constraint member_phone_ck check(phone like '010%') ,
					email varchar2(25) constraint member_email_uk unique,
					indate date);

insert into member(id, password, name, phone, email, indate)
		values('oracle',11111,'홍길도','010-1452-4152','tbjh@multi.com',sysdate); 


insert into member(id, password)
		values('oracl2',11111)
insert into member(id, password, name, phone, email, indate)
		values('oracle3',11111,NULL,NULL,NULL,NULL); 			
			
insert into member(ID, PASSWORD)
			select substr(first_name, 1,5), employee_id 
			from employees;		
			
insert into member(EMAIL, PASSWORD)
			select EMAIL, employee_id 
			from employees;			

insert into member(ID, EMAIL,PASSWORD)
			select EMPLOYEE_ID,EMAIL, manager_id 
			from employees where first_name !='Steven';
		
		
select * from member;









