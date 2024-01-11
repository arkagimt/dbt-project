{{ config(materialized='table') }}

SELECT
    JOB_ID,
    AVG(SALARY) as AVG_SALARY,
    COUNT(*) as TOTAL_EMPLOYEES
FROM {{ ref('stg_employee') }}
GROUP BY JOB_ID
