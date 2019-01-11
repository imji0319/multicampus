select first_name, salary
from employees
where first_name = INITCAP('jennifer')

select first_name, salary
from employees
where lower(first_name) = lower('jennifer')

select first_name, salary
from employees
where upper(first_name) = upper('jennifer')

select first_name, salary
from employees
where length(first_name) >= 8

select first_name, salary
from employees
where first_name like '________%'

-- 테이블 만큼 시스템의 시간이 나타남
select sysdate from employees
-- 한개 나타남 
select sysdate from dual

-- 특정값에 함수만 적용하기 위해 dual 임시 테이블 활용
select substr('AAABBB',3,3)
from dual

select instr(First_name,'Jen')
from employees

-- 10월 입사자의 입사일, 사번 조회
select hire_date, employee_id
from employees
where hire_date like '___10%';

select hire_date, employee_id
from employees
where instr(hire_date,'10') = 4;

-- first_name + last_name
select first_name || '-' || last_name as name
from employees

select concat(concat(first_name,'-'),last_name) as name
from employees


select mod(9,2) from dual

-- 짝수 사번 
select employee_id
from employees
where mod(employee_id,2)=0

select round(345.14159809) from dual
select round(345.14159809,1) from dual
select round(345.14159809,2) from dual
select round(345.14159809,-1) from dual
select round(345.14159809,-2) from dual

select trunc(345.14159809) from dual
select trunc(345.14159809,1) from dual
select trunc(345.14159809,2) from dual
select trunc(345.14159809,-1) from dual
select trunc(345.14159809,-2) from dual


-- 사원 입사 경과년도 조회, 연차
select first_name, hire_date, round((sysdate-hire_date)/365) ||'년 경과' as 연차
from employees

select first_name, hire_date, trunc(months_between(sysdate,hire_date)) ||'개월 경과' as 개월수
from employees














