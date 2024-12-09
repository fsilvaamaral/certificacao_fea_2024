with
    fonte as (
        select *
        from {{ source('erp', 'creditcard') }}
    )

    , renomeando as (
        select
            cast (CREDITCARDID as int) as id_cartao_credito
            , cast (CARDTYPE as varchar) as cartao_credito
            , cast (CARDNUMBER as int) as numero_cartao
            , cast (EXPMONTH as int) as mes_vencimento_cartao
            , cast (EXPYEAR as int) as ano_vencimento_cartao
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando