{{ config(materialized='table') }}

SELECT *
FROM {{ ref('sales') }}

