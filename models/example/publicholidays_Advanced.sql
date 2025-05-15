{{ config(materialized='table') }}

-- SELECT *
-- FROM {{ source('my_source', 'publicholidays') }}
-- WHERE countryOrRegion = 'Australia'


SELECT 
    {{ drop_columns(source('my_source', 'publicholidays'), exclude=['countryRegionCode']) }}
FROM {{ source('my_source', 'publicholidays') }}



