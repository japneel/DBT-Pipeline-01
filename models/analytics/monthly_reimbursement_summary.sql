-- models/analytics/monthly_reimbursement_summary.sql

{{ config(materialized = 'table') }}

select
    date_trunc('month', claim_date) as claim_month,
    count(*) as total_claims,
    sum(claim_amount) as total_amount
from {{ ref('stg_reimbursements') }}
group by 1
order by 1