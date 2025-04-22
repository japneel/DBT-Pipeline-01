-- models/HR/dep_emp_count.sql

{{ config(materialized='table') }}

select 
    d.department_name,
    count(e.employee_id) as employee_count
from {{ ref('stg_employees') }}     e
join {{ ref('stg_departments') }}   d
  on e.department_id = d.department_id
group by d.department_name
