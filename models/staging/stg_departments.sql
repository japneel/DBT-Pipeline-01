-- source data or departments

{{ config(materialized='view') }}

SELECT department_id, department_name 
FROM {{ source('company_reimbursements', 'departments') }}