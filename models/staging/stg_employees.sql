{{ config(materialized='view') }}

WITH source AS (
    SELECT
        employee_id,
        first_name,
        last_name,
        email,
        phone_number,
        job_id,
        salary,
        manager_id,
        department_id
    FROM {{ source('employee_source', 'employees') }}  -- Referencing the source and table
)

SELECT
    employee_id,
    first_name,
    last_name,
    email,
    COALESCE(phone_number, 'Not Provided') AS phone_number,
    job_id,
    salary,
    manager_id,
    department_id
FROM source
