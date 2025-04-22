-- source data or reimbursements

SELECT reimbursement_id, employee_id, type_id, claim_amount, claim_date, status, notes 
FROM {{ source('company_reimbursements', 'reimbursements') }}