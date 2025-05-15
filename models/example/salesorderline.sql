{{ config(materialized='ephemeral') }}

WITH line_item_totals AS (
    SELECT
        SalesOrderNumber,
        SalesOrderLineNumber,
        OrderDate,
        CustomerName,
        EmailAddress,
        Item,
        Quantity,
        UnitPrice,
        TaxAmount,
        -- Calculate line total including tax
        (Quantity * UnitPrice + TaxAmount) AS line_total_with_tax
    FROM {{ ref('salesdata') }}
)
