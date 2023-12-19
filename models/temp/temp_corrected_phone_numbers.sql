{{ config(materialized='ephemeral') }}

SELECT
    employee_id,
    REPLACE(phone_number, '.', '-') AS phone_number_corrected,
    first_name,
    last_name,
    email,
    job_id,
    salary,
    manager_id,
    department_id
FROM {{ ref('stg_employees') }}
