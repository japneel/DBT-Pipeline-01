-- source data or employees

SELECT employee_id, full_name, email, department_id 
FROM {{ source('company_reimbursements', 'employees') }}