-- =============================================================================
-- Test singular: ningún pedido puede no tener ninguna línea
-- =============================================================================
-- Un test singular es una SELECT que devuelve las filas que INCUMPLEN la regla.
-- Umbrales: con 1 a 10 filas da WARN; con más de 10, ERROR.
-- =============================================================================
{{
    config(
        severity='error',
        warn_if='>0',
        error_if='>10'
    )
}}

select
      O.order_id
    , OI.order_item_id
from {{ ref('fct_orders') }} O
left join {{ ref('fct_order_items') }} OI
    on O.order_id = OI.order_id
where OI.order_item_id IS NULL