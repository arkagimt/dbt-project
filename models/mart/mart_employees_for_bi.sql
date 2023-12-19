{{ config(materialized='table') }}

SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    e.phone_number_corrected,
    e.job_id,
    e.salary,
    e.manager_id,
    e.department_id,
    s.salary_range,
    h.manager_name
FROM {{ ref('temp_corrected_phone_numbers') }} e
LEFT JOIN {{ ref('temp_salary_range') }} s ON e.employee_id = s.employee_id
LEFT JOIN {{ ref('temp_manager_hierarchy') }} h ON e.employee_id = h.employee_id
