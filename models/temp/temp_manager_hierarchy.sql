{{ config(materialized='ephemeral') }}

SELECT
    e.employee_id,
    e.first_name || ' ' || e.last_name AS employee_name,
    m.employee_id AS manager_id,
    m.first_name || ' ' || m.last_name AS manager_name,
    e.department_id
FROM {{ ref('stg_employees') }} e
LEFT JOIN {{ ref('stg_employees') }} m ON e.manager_id = m.employee_id
