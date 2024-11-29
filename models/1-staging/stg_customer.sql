with
    fonte as (
        select *
        from {{ source('erp', 'customer') }}
    )

    , renomeando as (
        select
            cast (CUSTOMERID as int) as pk_cliente
            , cast (PERSONID as int) as id_cliente
            , cast (STOREID as int) as id_loja
            , cast (TERRITORYID as int) as id_territorio
            -- , ROWGUID
            -- , MODIFIEDDATE 
        from fonte
    )

    select *
    from renomeando