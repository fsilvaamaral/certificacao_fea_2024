with
    fonte_produto as (
        select
            id_produto
            , produto
            , cor_produto
            , numero_produto
            , id_subcategoria_produto
        from {{ ref('stg_product') }}
    )

    , fonte_categoria as (
        select *
        from {{ ref('stg_productcategory') }}
    )

    , fonte_subcategoria as (
        select
            id_subcategoria_produto
            , subcategoria_produto
            , id_categoria_produto
        from {{ ref('stg_productsubcategory') }}
    )

    , juntando_fontes as (
        select
        fonte_produto.id_produto
        , fonte_produto.produto
        , fonte_produto.cor_produto
        , fonte_produto.numero_produto
        , fonte_categoria.categoria_produto
        , fonte_subcategoria.subcategoria_produto
        from fonte_produto
        left join fonte_subcategoria on fonte_produto.id_subcategoria_produto = fonte_subcategoria.id_subcategoria_produto
        left join fonte_categoria on fonte_subcategoria.id_categoria_produto = fonte_categoria.id_categoria_produto
    )

    select *
    from juntando_fontes