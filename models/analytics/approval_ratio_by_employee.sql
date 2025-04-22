-- models/analytics/approval_ratio_by_employee.sql

{{ config(materialized='view') }}

select
    e.employee_id,
    e.full_name,
    count(case when r.status = 'Approved' then 1 end) as approved_count,
    count(*) as total_requests,
    round(
        count(case when r.status = 'Approved' then 1 end)::numeric / nullif(count(*), 0), 2
    ) as approval_ratio
from {{ ref('stg_employees') }} e
left join {{ ref('stg_reimbursements') }} r on e.employee_id = r.employee_id
group by e.employee_id, e.full_name
