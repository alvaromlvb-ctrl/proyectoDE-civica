-- =============================================================================
-- Análisis: prueba para ver si salta el aviso de deprecation_date
-- =============================================================================
-- Un análisis se compila (dbt compile) pero nunca se ejecuta como modelo.
-- Úsalo para sacar la lista real de valores ANTES de escribir un test
-- accepted_values: los valores salen de los datos, no de la intuición.
--   dbt compile --select valores_distintos_bronze
-- y ejecuta el SQL de target/compiled en Snowflake (o usa "Preview" en el IDE).
-- =============================================================================

select
    country,
    count(distinct country)
from {{ ref('dim_users', v=1) }}
group by country