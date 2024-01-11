{{ config(materialized='incremental') }}

SELECT *
FROM {{ ref('stg_employee') }}

{% if is_incremental() %}

  -- This filters out records already processed
  WHERE HIRE_DATE > (SELECT MAX(HIRE_DATE) FROM {{ this }})

{% endif %}
