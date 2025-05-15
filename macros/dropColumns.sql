{% macro drop_columns(source_relation, exclude=[]) %}
    {% set cols = adapter.get_columns_in_relation(source_relation) %}
    {% set selected_cols = [] %}
    {% for col in cols %}
        {% if col.name not in exclude %}
            {% do selected_cols.append(col.name) %}
        {% endif %}
    {% endfor %}
    {{ return(selected_cols | join(', ')) }}
{% endmacro %}
