with
    fonte as (
        select *
        from {{ source('erp', 'productsubcategory') }}
    )

    , renomeando as (
        select
            cast (PRODUCTSUBCATEGORYID as int) as id_subcategoria_produto
            , cast (PRODUCTCATEGORYID as int) as id_categoria_produto
            , cast (NAME as varchar) as subcategoria_produto
            --ROWGUID
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando