with
    fonte as (
        select *
        from {{ source('erp', 'address') }}
    )

    , renomeando as (
        select
            cast(ADDRESSID as int) as id_endereco
            , cast(ADDRESSLINE1 as varchar) as endereco
            , cast(ADDRESSLINE2 as varchar) as complemento_endereco
            , cast(CITY as varchar) as cidade
            , cast(STATEPROVINCEID as int) as id_estado
            , cast(POSTALCODE as varchar) as codigo_postal
            , cast(SPATIALLOCATION as varchar) as geolocalizacao
            --, ROWGUID
            --, MODIFIEDDATE 
        from fonte
    )

    select *
    from renomeando