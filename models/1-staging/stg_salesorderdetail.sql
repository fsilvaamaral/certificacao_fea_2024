with
    fonte as (
        select *
        from {{ source('erp', 'salesorderdetail') }}
    )

    , renomeando as (
        select
            cast (SALESORDERID as int) as id_pedido
            , cast (SALESORDERDETAILID as int) as id_pedido_detalhado
            , cast (ORDERQTY as int) as quantidade_pedido
            , cast (PRODUCTID as int) as id_produto
            , cast (UNITPRICE as float) as preco_unitario
            , cast (UNITPRICEDISCOUNT as float) as desconto_preco_unitario
            --CARRIERTRACKINGNUMBER
            --SPECIALOFFERID
            --ROWGUID
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando