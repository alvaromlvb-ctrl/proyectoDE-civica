-- =============================================================================
-- fct_orders
-- =============================================================================
-- Hechos de pedidos. Grano: una fila por pedido.
-- =============================================================================

with orders as (
    select * from {{ ref('gold_orders__enriched') }}
),

final as (
    select
          order_id
        , user_id
        , address_line
        , zipcode
        , state
        , country
        , promo
        , discount_usd
        , promo_status
        , created_at
        , estimated_delivery_at
        , delivered_at
        , tracking_id
        , shipping_service
        , shipping_cost
        , order_cost
        , order_total
        , status
        , is_deleted
        , date_load
    from orders
)

select * from final
