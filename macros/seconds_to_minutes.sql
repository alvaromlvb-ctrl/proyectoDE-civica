{% macro seconds_to_minutes(column_name) %}
    CAST({{ column_name }} AS DECIMAL(38, 2))/60
{% endmacro %}