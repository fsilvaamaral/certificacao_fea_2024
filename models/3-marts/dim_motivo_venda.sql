with
    dados_int as (
        select *
        from {{ ref('int_motivo_venda') }}
    )

    select *
    from dados_int