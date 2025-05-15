{{ config(materialized='table') }}

{% set tables = ['callmodel', 'salesdata'] %}

{% for tab in tables %}
    SELECT * FROM {{ ref(tab) }}
    {% if not loop.last %}
        UNION ALL
    {% endif %}
{% endfor %}
