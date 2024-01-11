{{ config(materialized='view') }}

SELECT *
FROM {{ source('employee_source', 'employee') }}
