with
    dados_int as (
        select *
        from {{ ref('int_produto') }}
    )

    , dim_produto as (
        select
            ID_PRODUTO
            , PRODUTO
            , COR_PRODUTO
            , NUMERO_PRODUTO
            , CATEGORIA_PRODUTO
            , SUBCATEGORIA_PRODUTO
        from dados_int
    )

    select *
    from dim_produto