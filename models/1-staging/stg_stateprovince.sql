with
    fonte as (
        select *
        from {{ source('erp', 'stateprovince') }}
    )

    , renomeando as (
        select
            cast(STATEPROVINCEID as int) as id_estado
            , cast(STATEPROVINCECODE as varchar) as codigo_estado
            , cast(COUNTRYREGIONCODE as varchar) as codigo_regiao_pais
            , cast(NAME as varchar) as estado
            , cast(TERRITORYID as int) as id_territorio
            -- ISONLYSTATEPROVINCEFLAG
            -- ROWGUID
            -- MODIFIEDDATE
        from fonte
    )

    select *
    from renomeando

