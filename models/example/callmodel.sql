--- calling model from another model and passing variable from CLI

{{ config(materialized='table') }}

{% set sales_order_number = var('sales_order_number', 'SO62984') %}

SELECT *
FROM {{ ref('salesdata') }}
WHERE SalesOrderNumber = '{{ sales_order_number }}'
