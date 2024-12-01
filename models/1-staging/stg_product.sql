with
    fonte as (
        select *
        from {{ source('erp', 'product') }}
    )

    , renomeando as (
        select
            cast (PRODUCTID as int) as id_produto
            , cast (NAME as varchar) as produto
            , cast (COLOR as varchar) as cor_produto
            , cast (STANDARDCOST as float) as custo_padrao_produto
            , cast (LISTPRICE as float) as preco_lista_produto
            , cast (PRODUCTSUBCATEGORYID as int) as id_subcategoria_produto
            , cast (PRODUCTNUMBER as varchar) as numero_produto
            --, cast (MAKEFLAG as varchar) as 
            --, cast (FINISHEDGOODSFLAG as varchar) as 
            --, cast (SAFETYSTOCKLEVEL as varchar) as 
            --, cast (REORDERPOINT as varchar) as 
            --, cast (SIZE as varchar) as 
            --, cast (SIZEUNITMEASURECODE as varchar) as 
            --, cast (WEIGHTUNITMEASURECODE as varchar) as 
            --, cast (WEIGHT as varchar) as 
            --, cast (DAYSTOMANUFACTURE as varchar) as 
            --, cast (PRODUCTLINE as varchar) as 
            --, cast (CLASS as varchar) as 
            --, cast (STYLE as varchar) as 
            --, cast (PRODUCTMODELID as varchar) as 
            --, cast (SELLSTARTDATE as varchar) as 
            --, cast (SELLENDDATE as varchar) as 
            --, cast (DISCONTINUEDDATE as varchar) as 
            --, cast (ROWGUID as varchar) as 
            --, cast (MODIFIEDDATE as varchar) as 
        from fonte
    )

    select *
    from renomeando