{# Here is my solution after removing most of the white spaces #}

{% macro no_empty_strings(model) -%}
  {%- set preds = [] -%}

  {%- for col in adapter.get_columns_in_relation(model) -%}
    {%- if col.is_string() -%}
      {%- set ident = adapter.quote(col.name) -%}
      {%- do preds.append(ident ~ " IS NOT NULL AND " ~ ident ~ " <> ''") -%}
    {%- endif -%}
  {%- endfor -%}

  {%- if preds | length > 0 -%}
    {{- preds | join(' AND ') -}}
  {%- else -%}
    TRUE
  {%- endif -%}
{%- endmacro %}
