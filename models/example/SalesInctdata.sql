{{ config(
    materialized='incremental',
    unique_key=['SalesOrderNumber', 'SalesOrderLineNumber']  
) }}

SELECT *
FROM {{ source('my_source', 'salesnewdata') }}

{% set start_date = var('start_date', '2021-12-29') %}

{% if is_incremental() %}
 
    WHERE OrderDate > '{{ start_date }}'
{% endif %}