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

select '100'+1 from dual

select to_number('100,000','000,000')+1 from dual

select to_char(100000,'000,000') from dual

select round(sysdate-to_date('19/01/01','yy/mm/dd')) from dual

select hire_date, to_char(hire_date,'fmmm:dd:yyyy') from employees
select hire_date, to_char(hire_date,'fmmm"월" dd"일" yyyy"년도" hh-mi-ss') from employees

-- 사원의 이름, 부서코드 조회하되 부서코드 null이면 '미배정'으로 출력
select first_name, nvl(to_char(department_id),'미배정') 
from employees where department_id is null

-- join
-- 사원 이름과 부서이름 조회 : join 
select employee_id, e.department_id,department_name
from employees e, departments d
where e.department_id = d.department_id


-- 사원 이름과 부서이름 조회 단, 사원명 Jennifer
select employee_id, first_name,department_name
from employees e, departments d
where e.department_id = d.department_id AND upper(first_name) = upper('jennifer')


-- 모든 사원 이름(employees), 근무 도시명(locations) 출력
select first_name, city
from employees e, departments d,locations l
where e.department_id = d.department_id AND d.location_id = l.location_id

-- 각 사원의 사번, 이름, 상사사번, 상사이름 : 자기 자신테이블을 조인
select me.employee_id, me.first_name, manager.employee_id, manager.first_name
from employees me, employees manager
where me.manager_id = manager.employee_id;

--outer join : null이 없는 쪽에 (+) -> 상사가 없어도 
select me.employee_id, me.first_name, nvl(to_char(manager.employee_id),'사장님'), nvl(manager.first_name,'BOSS')
from employees me, employees manager
where me.manager_id = manager.employee_id(+);

-- 사원 이름, 부서이름 조회  outer join 으로 부서가 없어도 출력.
select first_name, nvl(department_name,'미배정')
from employees e, departments d
where e.department_id = d.department_id(+)

-- Sharh 와 같은 부서에 근무하는 사원의 이름, 부서코드
select first_name, department_id
from employees
where department_id = (select department_id
					from employees 
					where upper(first_name) = upper('sarah'))

-- Sharh 와 같은 부서, 같은 급여인 사원의 이름, 부서코드
select first_name, department_id
from employees
where (department_id,salary) = (select department_id,salary
					from employees 
					where upper(first_name) = upper('sarah'))

-- jennifer 와 같은 부서에 근무하는 사원의 이름, 부서코드
select first_name, department_id
from employees
where department_id in (select department_id
					from employees 
					where upper(first_name) = upper('jennifer'))

-- sarah 급여보다 많은 사원이름 급여
select first_name, salary
from employees
where salary > (select salary
				from employees
				where upper(first_name) = upper('sarah'))

-- jennifer 급여보다 많은 사원이름 급여
select first_name, salary
from employees
where salary > ALL (select salary
				from employees
				where upper(first_name) = upper('jennifer'))
order by first_name
					
					
					
					
					
