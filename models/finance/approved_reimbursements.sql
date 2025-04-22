-- models/finance/approved_reimbursements.sql

{{ config(materialized='table') }}

SELECT
    r.reimbursement_id,
    r.employee_id,
    e.full_name AS employee_name,
    d.department_name,
    rt.type_name AS reimbursement_type,
    r.claim_amount,
    r.status,
    r.notes
FROM {{ ref('stg_reimbursements') }}        r
JOIN {{ ref('stg_employees') }}             e  ON r.employee_id = e.employee_id
JOIN {{ ref('stg_departments') }}           d  ON e.department_id = d.department_id
JOIN {{ ref('stg_reimbursement_types') }}   rt ON r.type_id = rt.type_id
WHERE r.status = 'Approved'