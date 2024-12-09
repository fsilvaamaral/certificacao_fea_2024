with
    fonte as (
        select *
        from {{ source('erp', 'salesorderheader') }}
    )

    , renomeando as (
        select
            cast (SALESORDERID as int) as id_pedido
            , cast (ORDERDATE as date) as data_pedido
            , cast (SHIPDATE as date) as data_envio_pedido
            , cast (STATUS as int) as status_pedido
            , case 
                when ONLINEORDERFLAG = true then 'Loja Online'
                else 'Loja Física'
            end as local_venda
            , cast (PURCHASEORDERNUMBER as varchar) as numero_pedido
            , cast (CUSTOMERID as int) as id_cliente
            , cast (SALESPERSONID as int) as id_funcionario
            , cast (TERRITORYID as int) as id_territorio 
            , cast (SHIPTOADDRESSID as int) as id_endereco
            , cast (CREDITCARDID as int) as id_cartao_credito
            , cast (SUBTOTAL as float) as subtotal_produto
            , cast (TAXAMT as float) as imposto_produto
            , cast (FREIGHT as float) as frete_produto
            , cast (TOTALDUE as float) as total_pedido
            --REVISIONNUMBER
            --DUEDATE
            --ACCOUNTNUMBER
            --BILLTOADDRESSID
            --SHIPMETHODID
            --CREDITCARDAPPROVALCODE
            --CURRENCYRATEID
            --COMMENT
            --ROWGUID
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando