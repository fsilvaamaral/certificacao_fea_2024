with
    fonte_pedidos as (
        select *
        from {{ ref('stg_salesorderheadersalesreason') }}
    )

    , fonte_motivos as (
        select *
        from {{ ref('stg_salesreason') }}
    )

    , juntando_fontes as (
        select
            fonte_pedidos.id_pedido
            , fonte_motivos.id_motivo_venda
            , fonte_motivos.motivo_venda
            , fonte_motivos.tipo_motivo
        from fonte_pedidos
        left join fonte_motivos on fonte_pedidos.id_motivo_venda = fonte_motivos.id_motivo_venda
    )

    select *
    from juntando_fontes