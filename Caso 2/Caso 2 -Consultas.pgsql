-- CONSULTAS
--*1. Obtenga el nombre completo (first_name y last_name) y el salario (salary) de todos los empleados. Cambie el nombre de la columna first_name a Nombre y last_name a Apellido y salary a Salario.
SELECT first_name as Nombre, last_name as Apellido, salary as Salario from employees;
--*2. Obtenga el nombre completo (first_name y last_name) y el salario (salary) de todos los empleados ordenado alfabéticamente por apellido (last_name).
SELECT first_name, last_name, salary from employees ORDER by last_name;
--*3. Obtenga el apellido (last_name) y la Comisión (commission_pct) que perciben los empleados cuya comisión sea mayor a 0.25. Mostrarlos ordenados en forma descendente por last_name.
(SELECT last_name, commission_pct from employees where commission_pct > 0.25) order by last_name DESC;
--*4. Obtenga la cantidad de empleados que trabajan en el departamento 100.
SELECT count(*) from employees where department_id = 100;
--*5. Obtenga todos los datos de los departamentos con identificador 10 ó 70 (department_id).
SELECT * from departments where department_id = 10 or department_id= 70;

--*6. Obtenga el apellido (last_name) de los empleados junto al nombre del departamento (department_name) donde trabajan.
SELECT last_name, department_name from employees natural join departments;
--*7. Obtenga el apellido (last_name) de los empleados de los departamentos de Finanzas (Finance) y/o Transporte (Shipping).
SELECT last_name from employees where department_id in (SELECT department_id from departments where department_name='Finance' or department_name='Shipping'); 
--*8. Obtenga sin repetir los tipos de trabajos (jobs) que realizan en los departamentos los empleados. Liste el identificador del departamento y el nombre del trabajo.
SELECT DISTINCT department_id,job_title from job_history NATURAL JOIN jobs;
--*9. Obtenga los departamentos en los que los empleados realizan trabajos de Contabilidad (Stock Clerk) y Asistente de Administración (Shipping Clerk). Liste el identificador del departamento y el nombre del trabajo. 

SELECT department_id,job_title from job_history NATURAL JOIN jobs WHERE job_title='Stock Clerk' INTERSECT SELECT department_id,job_title from job_history NATURAL JOIN jobs WHERE job_title='Shipping Clerk';
--*10. Obtenga el nombre de los departamentos que tienen al menos 3 empleados.

SELECT department_name
FROM employees NATURAL JOIN departments
GROUP BY department_name
HAVING COUNT(*) >= 3;
--*11. Obtenga el apellido de los empleados (last_name) y el salario (salary) de aquellos empleados que tienen un salario mayor que el salario promedio. Ordene el listado en forma descendente por salario.

SELECT last_name, salary from employees WHERE salary > (SELECT avg(salary) from employees) order by salary DESC;
--*12. Obtenga el salario máximo de los empleados del departamento 110. Ordene el listado en forma ascendente por salario.
SELECT salary from employees where department_id=110 ORDER by salary ASC;
--*13. Obtenga el nombre del/de los empleados que tienen el sueldo máximo del departamento 110. Ordene el listado en forma ascendente por salario.

SELECT max(salary) from employees where department_id=110;
--*14. Obtenga todos los datos de los empleados que no sean supervisores (o directores). NOTA: En la tabla departments el atributo manager_id tiene la identificación de los supervisores de cada dpto.

SELECT * FROM employees WHERE manager_id NOT IN (
    SELECT employee_id
    FROM employees
);