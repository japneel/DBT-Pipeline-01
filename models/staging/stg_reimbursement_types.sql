-- source data or reimbursement_types

SELECT type_id, type_name, limit_amount 
FROM {{ source('company_reimbursements','reimbursement_types') }}