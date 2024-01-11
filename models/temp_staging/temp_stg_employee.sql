{{ config(materialized='ephemeral') }}

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL
FROM {{ ref('stg_employee') }}
