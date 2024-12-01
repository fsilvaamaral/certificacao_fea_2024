with
    dados_int as (
        select *
        from {{ ref('int_cliente') }}
    )

    , dim_cliente as (
        select
            id_entidade_negocio as pk_cliente
            , nome_completo
            , id_loja_cliente
            , id_territorio_cliente
        from dados_int
    )

    select *
    from dim_cliente