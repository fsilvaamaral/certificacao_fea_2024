with
    fonte as (
        select *
        from {{ source('erp', 'customer') }}
    )

    , renomeando as (
        select
            cast (CUSTOMERID as int) as id_cliente_fonte
            , cast (PERSONID as int) as id_pessoa_cliente
            , cast (STOREID as int) as id_loja_cliente
            , cast (TERRITORYID as int) as id_territorio_cliente
            -- , ROWGUID
            -- , MODIFIEDDATE 
        from fonte
    )

    select *
    from renomeando