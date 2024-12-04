with
    fonte_address as (
        select
            id_endereco
            , endereco
            , complemento_endereco
            , cidade
            , id_estado
        from {{ ref('stg_address') }}
    )

    , fonte_stateprovince as (
        select
            id_estado
            , codigo_estado
            , codigo_regiao_pais
            , estado
            , id_territorio
        from {{ ref('stg_stateprovince') }}
    )

    , fonte_countryregion as (
        select
            codigo_regiao_pais
            , pais
        from {{ ref('stg_countryregion') }}
    )

    , juntando_fontes as (
        select
            fonte_address.id_endereco
            , fonte_address.endereco
            , fonte_address.complemento_endereco
            , fonte_address.cidade
            , fonte_stateprovince.id_estado
            , fonte_stateprovince.codigo_estado
            , fonte_stateprovince.estado
            , fonte_stateprovince.id_territorio
            , fonte_countryregion.codigo_regiao_pais
            , fonte_countryregion.pais
        from fonte_address
        left join fonte_stateprovince on fonte_address.id_estado = fonte_stateprovince.id_estado
        left join fonte_countryregion on fonte_stateprovince.codigo_regiao_pais = fonte_countryregion.codigo_regiao_pais
    )

    select *
    from juntando_fontes