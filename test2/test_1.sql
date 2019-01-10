select tname from tab;

select * from employees;

select employee_id, hire_date from employees

select employee_id, hire_date from employees 
where hire_date like '08/__/__'

select employee_id, hire_date from employees 
where hire_date like '%/01/%'

select employee_id, hire_date 
from employees 
where hire_date >= '08/01/01' 
		AND hire_date <='08/12/31'

select employee_id, hire_date 
from employees 
where substr(hire_date,1,2) = '08';

		
select employee_id, hire_date 
from employees 
where substr(hire_date,4,2) = '01';	

select employee_id, hire_date 
from employees 
where employee_id in  (100,150,200,250) ;
		
select * from employees
order by employee_id desc

select * from employees
order by first_name desc

select * from employees
order by salary desc, employee_id asc

select employee_id, hire_date 
from employees 
where hire_date like '%/01/%'
order by employee_id desc		

--NULL 값 : 가장 마지막 , nulls last : default -> 먼저 보여줘 nulls first
select commission_pct from employees
order by commission_pct asc nulls first

select sum(salary) from employees		
select avg(salary) from employees			
select count(salary) from employees	

select count(commission_pct) from employees	

select department_id, sum(salary)
from employees
group by department_id
order by department_id
		
		

select department_id, sum(salary)
from employees
group by department_id
having sum(salary)>=50000;