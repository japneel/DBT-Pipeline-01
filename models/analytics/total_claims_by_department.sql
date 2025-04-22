-- models/analytics/total_claims_by_department.sql

{{ config(materialized = 'table') }}

with claims as (
    select
        e.department_id,
        sum(r.claim_amount) as total_claimed
    from {{ ref('stg_employees') }} e
    join {{ ref('stg_reimbursements') }} r on e.employee_id = r.employee_id
    group by e.department_id
)

select
    d.department_name,
    c.total_claimed
from claims c
join {{ ref('stg_departments') }} d on c.department_id = d.department_id