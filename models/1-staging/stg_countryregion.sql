with
    fonte as (
        select *
        from {{ source('erp', 'countryregion') }}
    )

    , renomeando as (
        select
            cast (COUNTRYREGIONCODE as varchar) as codigo_regiao_pais
            , cast (NAME as varchar) as pais
            --MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando