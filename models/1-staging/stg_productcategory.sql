with
    fonte as (
        select *
        from {{ source('erp', 'productcategory') }}
    )

    , renomeando as (
        select
            cast (PRODUCTCATEGORYID as int) as id_categoria_produto
            , cast (NAME as varchar) as categoria_produto
            --ROWGUID
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando