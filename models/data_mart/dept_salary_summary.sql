{{ config(materialized='table') }}

WITH department_salary AS (
    SELECT
        DEPARTMENT_ID,
        AVG(SALARY) AS avg_salary,
        COUNT(*) AS total_employees
    FROM {{ ref('stg_employee') }}
    GROUP BY DEPARTMENT_ID
)

SELECT
    DEPARTMENT_ID,
    avg_salary,
    total_employees
FROM department_salary
