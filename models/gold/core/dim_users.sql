-- =============================================================================
-- dim_users
-- =============================================================================
-- Capa Gold: denormaliza para tener toda la información necesaria para el caso
-- de uso en una tabla.
-- =============================================================================

with users as (
    select * from {{  ref('slv_sql_server_dbo__users')  }}
),

final as (
    select
          user_id
        , first_name
        , last_name
        , email
        , phone_number
        , address_id
        , created_at
        , updated_at
        , is_deleted
        , date_load
    from users
)

select * from final