with
    dados_int as (
        select *
        from {{ ref('int_motivo_venda') }}
        order by id_pedido
    )

    , agregando as (
        select
            id_pedido
            , listagg(motivo_venda, ', ') within group (order by motivo_venda asc) as agg_motivo_venda
            , listagg(tipo_motivo, ', ') within group (order by tipo_motivo asc) as agg_tipo_motivo
            --, string_agg (motivo_venda, ', ') as agg_motivo_venda
            --, string_agg (tipo_motivo, ', ') as agg_tipo_motivo
        from dados_int
        group by id_pedido
    )

    select *
    from agregando