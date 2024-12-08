with
    fonte as (
        select *
        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

    , renomeando as (
        select
            cast (salesorderid as int) as id_pedido
            , cast (salesreasonid as int) as id_motivo_venda
            --modifieddate
        from fonte
    )

    select *
    from renomeando