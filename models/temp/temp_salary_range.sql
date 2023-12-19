{{ config(materialized='ephemeral') }}

SELECT
    employee_id,
    first_name,
    last_name,
    job_id,
    department_id,
    salary,
    CASE 
        WHEN salary <= 5000 THEN 'Low'
        WHEN salary > 5000 AND salary <= 10000 THEN 'Medium'
        WHEN salary > 10000 THEN 'High'
        ELSE 'Not Specified'
    END AS salary_range
FROM {{ ref('stg_employees') }}
