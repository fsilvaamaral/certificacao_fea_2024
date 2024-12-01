with
    fonte_cliente as (
        select *
        from {{ ref('stg_customer') }}
    )

    , fonte_pessoa as (
        select *
        from {{ ref('stg_person') }}
    )

    , juntando_fontes as (
        select
            fonte_pessoa.id_entidade_negocio
            , fonte_cliente.id_pessoa_cliente
            , fonte_pessoa.tipo_pessoa
            , fonte_pessoa.nome_completo
            , fonte_pessoa.primeiro_nome
            , fonte_pessoa.nome_do_meio
            , fonte_pessoa.sobrenome
            , fonte_cliente.id_loja_cliente
            , fonte_cliente.id_territorio_cliente
        from fonte_pessoa
        left join fonte_cliente on fonte_pessoa.id_entidade_negocio = fonte_cliente.id_pessoa_cliente
        where fonte_pessoa.tipo_pessoa = 'IN'
    )

    select *
    from juntando_fontes