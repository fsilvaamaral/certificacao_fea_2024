with
    dados_int as (
        select
            id_pedido_detalhado as id_produto_pedido
            , id_pedido
            , id_produto
            , id_cliente
            , id_endereco
            , data_pedido
            , data_envio_pedido
            , status_pedido
            , local_venda
            , cartao_credito
            , quantidade_pedido
            , preco_unitario
            , desconto_preco_unitario
        from {{ ref('int_vendas') }}
    )

    , regras_negocio as (
        select *
            , preco_unitario * quantidade_pedido as total_bruto
            , preco_unitario * (1 - desconto_preco_unitario) * quantidade_pedido as total_liquido
        from dados_int
    )

    select *
    from regras_negocio