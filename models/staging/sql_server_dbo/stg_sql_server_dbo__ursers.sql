-- =============================================================================
-- stg_sql_server_dbo__addresses
-- =============================================================================
-- Capa Staging: relación 1:1 con la tabla de Bronze. Solo renombrado y casteado.
-- Aquí no se filtra ni se deduplica: los borrados lógicos se exponen como
-- is_deleted y es Silver quien decide qué hacer con ellos.
-- =============================================================================

with source as (
    select * from {{ source('sql_server_dbo', 'users') }}
),

renamed as (
    select
          user_id
        , first_name
        , last_name
        , email
        , phone_number
        , address_id
        , created_at
        , updated_at
        , coalesce(_fivetran_deleted, false) AS is_deleted
        , _fivetran_synced                   AS date_load
        , _loaded_at
    from source
)

select * from renamed