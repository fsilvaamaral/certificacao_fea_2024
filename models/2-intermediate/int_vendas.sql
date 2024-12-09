with
    fonte_cartao as (
        select
            id_cartao_credito
            , cartao_credito
        from {{ ref('stg_creditcard') }}
    )

    , fonte_cabecalho as (
        select
            id_pedido
            , data_pedido
            , data_envio_pedido
            , status_pedido
            , local_venda
            , numero_pedido
            , id_cliente
            , id_endereco
            , id_cartao_credito
        from {{ ref('stg_salesorderheader') }}
    )

    , fonte_vendas as (
        select
            id_pedido_detalhado
            , id_pedido
            , quantidade_pedido
            , id_produto
            , preco_unitario
            , desconto_preco_unitario
        from {{ ref('stg_salesorderdetail') }}
    )

    , juntando_fontes as (
        select
            fonte_vendas.id_pedido_detalhado
            , fonte_vendas.id_pedido
            , fonte_vendas.quantidade_pedido
            , fonte_vendas.id_produto
            , fonte_vendas.preco_unitario
            , fonte_vendas.desconto_preco_unitario
            , fonte_cabecalho.data_pedido
            , fonte_cabecalho. data_envio_pedido
            , fonte_cabecalho.status_pedido
            , fonte_cabecalho.local_venda
            , fonte_cabecalho.numero_pedido
            , fonte_cabecalho.id_cliente
            , fonte_cabecalho.id_endereco
            , fonte_cabecalho.id_cartao_credito
            , fonte_cartao.cartao_credito
        from fonte_vendas
        left join fonte_cabecalho on fonte_cabecalho.id_pedido = fonte_vendas.id_pedido
        left join fonte_cartao on fonte_cartao.id_cartao_credito = fonte_cabecalho.id_cartao_credito
    )

    select *
    from juntando_fontes