
{% macro margin_percent(column_1, column_2)%}
    ROUND(SAFE_DIVIDE({{column_1}}, {{column_2}}),2)
{% endmacro %}