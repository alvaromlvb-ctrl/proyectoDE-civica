-- =============================================================================
-- events_sin_id
-- =============================================================================
-- Hechos de eventos de navegación sin id. Grano: una fila por evento.
-- =============================================================================

{% set columnas_excluidas = ['event_id'] %}

with events_sin_id as (
    select
        {{ dbt_utils.star(ref('slv_sql_server_dbo__events'), except = columnas_excluidas) }}
    from {{ ref('slv_sql_server_dbo__events') }}
)

select * from events_sin_id