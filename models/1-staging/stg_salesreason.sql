with
    fonte as (
        select *
        from {{ source('erp', 'salesreason') }}
    )

    , renomeando as (
        select
            cast (SALESREASONID as int) as id_motivo_venda
            , cast (NAME as varchar) as motivo_venda
            , cast (REASONTYPE as varchar) as tipo_motivo
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando