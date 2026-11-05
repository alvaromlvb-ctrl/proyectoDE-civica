-- =============================================================================
-- gold_orders__enriched
-- =============================================================================
-- Capa Gold: denormaliza para tener toda la información necesaria para el caso
-- de uso en una tabla.
-- =============================================================================

with orders as (
    select * from {{ ref('slv_sql_server_dbo__orders') }}
),

addresses as (
    select * from {{ ref('slv_sql_server_dbo__addresses')}}
),

promos as (
    select * from {{  ref('slv_sql_server_dbo__promos')}}
),

enriched as (
    select
          O.order_id
        , user_id
        , address_line
        , zipcode
        , state
        , country
        , O.promo_id     AS promo
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
        , O.date_load
    from orders O
    left join addresses A
        on O.address_id = A.address_id
    left join promos P
        on O.promo_id = P.promo_id
)

select * from enriched